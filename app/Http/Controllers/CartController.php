<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Country;
use App\Models\CustomerAddress;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class CartController extends Controller
{
    public function addToCart(Request $request) {
        $product = Product::with("product_images") -> find($request -> id);

        if($product == null) {
            return response() -> json([
                "status"=> false,
                "message" => "Product not found"
            ]);
        }

        if(Cart::count() > 0) {
           // echo"product in cart";
           // Products found in cart
           // Check if this product is already in cart
           // Return as message that phat product already added in your cart
           // if product in the crat, then add product in cart

           $cartContent = Cart::content();
           $productAlreadyExist = false;
           foreach ($cartContent as $item) {
                if($item -> id == $product -> id) {
                    $productAlreadyExist = true;
                }
           }

           if ($productAlreadyExist == false) {
            Cart::add($product->id, $product->title, 1, $product->price, ["main_image" => $product->main_image]);

            $status = true;
            $message = $product -> title . " added in your cart successfully";
            session() -> flash("success", $message);

           } else {
            $status = false;
            $message = "<strong>" . $product -> title . "</strong> added in cart successfully";
            session() -> flash("success", $message);
           }
        } else {
            Cart::add($product->id, $product->title, 1, $product->price, ["main_image" => $product->main_image]);
            $status = true;
            $message = "<strong>" . $product -> title . "</strong> added in cart successfully";
            session() -> flash("success", $message);
        }

        return response() -> json([
            "status"=> $status,
            "message" => $message
        ]);

    }

    public function cart() {
        $cartContent = Cart::content();
        //dd($cartContent);
        $data['cartContent'] = $cartContent;
        return view("front.cart", $data);
    }

    public function updateCart(Request $request) {
        $rowId = $request -> rowId;
        $qty = $request -> qty;

        $itemInfo = Cart::get($rowId);

        $product = Product::find($itemInfo -> id);
        // Check qty available in stock

        if ($product -> track_qty == "Yes") {
            if(  $qty <= $product -> qty) {
                Cart::update($rowId, $qty);
                $message = "Cart updated successfully";
                $status = true;
                session() -> flash("success", $message);
            } else {
                $message = "Requested quantity(".$qty.") not available in stock.";
                $status = false;
                session() -> flash("error", $message);
            }
        } else {
            Cart::update($rowId, $qty);
            $message = "Cart updated successfully";
            $status = true;
            session() -> flash("success", $message);
        }

        return response() -> json([
            "status" => $status,
            "message" => $message
        ]);
    }

    public function deleteItem(Request $request) {

        $itemInfo = Cart::get($request -> rowId);
        
        if ($itemInfo == null) {
            $errorMessage = "Item not found in cart";
            session() -> flash("error", $errorMessage);
            
            return response() -> json([
                "status" => false,
                "message" => $errorMessage
            ]);  
        }

        Cart::remove($request -> rowId);

        $message = "Item removed from cart successfully";
        
        session() -> flash("success", $message);

        return response() -> json([
            "status" => false,
            "message" => $message
        ]);

    }

    public function checkout() {

        if(Cart::count() == 0) {
            return redirect() -> route("front.cart");
        }

        // if user is not logged in then redirect to login page
        if (Auth::check() == false) {

            if(session() -> has("url.intended")) {
                session(["url.intended" => url() -> current() ]);
            }
            return redirect() -> route("account.login");
        }

        
        $user = Auth::user();

        $customerAddress = CustomerAddress::where("user_id", $user->id)->first();

        session()->forget("url.intended");

        $countries = Country::orderBy("name", "ASC")->get();

        return view("front.checkout", [
            "countries" => $countries,
            "customerAddress" => $customerAddress,
        ]);
    }

    public function processCheckout(Request $request) {

        // pasul 1 - Apply validation

        $validator = Validator::make($request -> all(), [
            "first_name" => "required|min:3",
            "last_name" => "required|min:3",
            "email" => "required|email",
            "country" => "required",
            "address" => "required|min:8",
            "city" => "required",
            "zip" => "required",
            "mobile" => "required"
        ]);

        if ($validator -> fails()) {
            return response() -> json([
                "message" => "Please fill all the required fields ! ",
                "status" => false,
                "errors" => $validator -> errors()
            ]);
        }

        // pasul 2 - Save user orders

        $user = Auth::user();

        CustomerAddress::updateOrCreate(
            ["user_id" => $user -> id],
            [
                "user_id" => $user -> id,
                "first_name" => $request -> first_name,
                "last_name" => $request -> last_name,
                "email" => $request -> email,
                "mobile" => $request -> mobile,
                "country_id" => $request -> country,
                "address" => $request -> address,
                "apartment" => $request -> apartment,
                "city" => $request -> city,
                "state" => $request -> state,
                "zip" => $request -> zip,
            ]
        );

        // pasul 3 - Store data in orders table

        $shipping = 0;
        $subTotal = Cart::subtotal(2, ".","");
        $grandTotal = $subTotal + $shipping;

        $order = new Order;
        $order -> subtotal = $subTotal;
        $order -> shipping = $shipping;
        $order -> grand_total = $grandTotal;
        $order -> user_id = $user -> id;
        $order -> first_name = $request -> first_name;
        $order -> last_name = $request -> last_name;
        $order -> email = $request -> email;
        $order -> mobile = $request -> mobile;
        $order -> address = $request -> address;
        $order -> apartment = $request -> apartment;
        $order -> state = $request -> state;
        $order -> city = $request -> city;
        $order -> zip = $request -> zip;
        $order -> notes = $request -> order_notes;
        $order -> country_id = $request -> country;
        $order -> save();

        // pasul 4 - Store order items in order items table

        foreach(Cart::content() as $item){
            $orderItem = new OrderItem;
            $orderItem ->product_id = $item -> id;
            $orderItem ->order_id = $order -> id;
            $orderItem ->name = $item -> name;
            $orderItem ->qty = $item -> qty;
            $orderItem ->price = $item -> price;
            $orderItem ->total = $item -> price * $item -> qty;
            $orderItem -> save();
        }
        
        session() -> flash("success", "You have successfully placed your order");

        Cart::destroy();

        return response() -> json([
            "message" => "Order saved successfully !",
            "orderId" => $order -> id,
            "status" => true,
        ]);



    }

    public function thankyou($id) {
        return view("front.thanks", [
            "id" => $id
        ]);
    }

}
