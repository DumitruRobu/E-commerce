<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Auth;

class FrontController extends Controller
{
    public function index(Request $request) {

        $products = Product::where("is_featured","Yes") -> orderBy("id","DESC") -> take(8) -> where("status",1) -> get();
        $data["featuredProducts"] = $products;

        if($request -> get("keyword") != "") {
            $products = $products -> where("title","like","%" . $request -> keyword . "%");
        }

        $latestProducts = Product::orderBy("id","DESC") -> where("status",1) -> take(8) -> get();
        $data["latestProducts"] = $latestProducts;
        return view("front.home", $data);
    }

    public function addToWishlist(Request $request) {

        if(Auth::check() == false) {

            session(["url.intended" => url() -> previous()]);

            return response() -> json([
                "status" => false,
            ]);
        }

        Wishlist::updateOrCreate(
            [
                "user_id" => Auth::user() -> id,
                "product_id" => $request -> id,
            ],
            [
                "user_id" => Auth::user() -> id,
                "product_id" => $request -> id,
            ]
        );


        $product = Product::where("id", $request -> id) -> first();

        if($product == null) {
            return response() -> json([
                "status" => true,
                "message" => "<div class='alert alert-danger'>Product not found</div>",
            ]);    
        }

        return response() -> json([
            "status" => true,
            "message" => "<div class='alert alert-success'><strong>" . $product -> title ."</strong> added in your wishlist</div>",
        ]);

    }
}
