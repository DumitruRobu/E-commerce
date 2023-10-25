<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use App\Models\Product; 
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{

    public function index(Request $request) {
        $products = Product::latest("id") -> with("product_images"); 
        
        if($request -> get("keyword") != "") {
            $products = $products -> where("title","like","%" . $request -> keyword . "%");
        }

        $products = $products -> paginate();
        $data["products"] = $products;
        return view("admin.products.list", $data);
    }

    public function create() {
        $data = [];
        $categories = Category::orderBy("name","ASC") -> get();
        $data["categories"] = $categories; 
        return view("admin.products.create", $data);
    }

    public function store(Request $request) {
        $rules = [
            "title" => "required",
            "price" => "required|numeric",
            "track_qty" => "required|in:Yes,No",
            "category" => "required",
            "main_image" => "required|url",
            "is_featured" => "required|in:Yes,No",
            "gender" => "required|in:Male,Female",
            "additional_images.*" => "nullable|url"
        ];

        if(!empty($request -> track_qty) && $request -> track_qty == "Yes"){
            $rules["qty"] = "required|numeric";
        }

        $validator = Validator::make($request -> all(),$rules); 

        if($validator -> passes()) {

            $product = new Product;
            $product -> title = $request -> title;
            $product -> description = $request -> description;
            $product -> price = $request -> price;
            $product -> main_image = $request -> input('main_image');
            $product -> compare_price = $request -> compare_price;
            $product -> track_qty = $request -> track_qty;
            $product -> qty = $request -> qty;
            $product -> status = $request -> status;
            $product -> category_id = $request -> category;
            $product -> is_featured = $request -> is_featured;
            $product->gender = $request->input('gender');
            $product -> save();

            $newProductId = $product->id;

            if ($request->has('additional_images')) {
                $additionalImages = $request->input('additional_images');
                $product->additional_images = json_encode($additionalImages);
                
                foreach ($additionalImages as $imageUrl) {
                    DB::table('product_images')->insert([
                        'product_id' => $newProductId,
                        'image_url' => $imageUrl,
                    ]);
                }

            }    

        $product->save();

        return response() -> json([
            "status" => true,
            "message" => "Product added successfully"
        ]);
    } else {
        return response() -> json([
            "status" => false,
            "errors" => $validator -> errors()
        ]);
    }
        
    }

    public function edit($id, Request $request) {

        $product = Product::find($id);

        if(empty($product)) {
            return redirect() -> route("products.index") -> with("error", "Product not found");
        }

        $additionalImages = $product->additional_images ? json_decode($product->additional_images) : [];
        $cleanedAdditionalImages = array_map('stripslashes', $additionalImages);

        if (is_array($additionalImages)) {
            $cleanedAdditionalImages = array_map('stripslashes', $additionalImages);
        } else {
            $cleanedAdditionalImages = [];
        }    

        $data = [];
        $data = [
        "product" => $product,
        "cleanedAdditionalImages" => $cleanedAdditionalImages
        ];
        $categories = Category::orderBy("name","ASC") -> get();
        $data["categories"] = $categories;
        return view("admin.products.edit", $data);
    }

    public function update($id, Request $request) {

        $product = Product::find($id);

        $rules = [
            "title" => "required",
            "price" => "required|numeric",
            "track_qty" => "required|in:Yes,No",
            "category" => "required",
            "main_image" => "required|url",
            "is_featured" => "required|in:Yes,No",
            "gender" => "required|in:Male,Female",
            "additional_images.*" => "nullable|url"
        ];

        if(!empty($request -> track_qty) && $request -> track_qty == "Yes"){
            $rules["qty"] = "required|numeric";
        }

        $validator = Validator::make($request -> all(),$rules); 

        if($validator -> passes()) {

            $product -> title = $request -> title;
            $product -> description = $request -> description;
            $product -> price = $request -> price;
            $product -> main_image = $request -> input('main_image');
            $product -> compare_price = $request -> compare_price;
            $product -> track_qty = $request -> track_qty;
            $product -> qty = $request -> qty;
            $product -> status = $request -> status;
            $product -> category_id = $request -> category;
            $product -> is_featured = $request -> is_featured;
            $product->gender = $request->input('gender');
            $product -> save();
            
            $request -> session() -> flash("success","Product updated successfully");

            if ($request->has('additional_images')) {
                $additionalImages = $request->input('additional_images');
                $product->additional_images = json_encode($additionalImages);
            }    

            $product->save();

            return response() -> json([
                "status" => true,
                "message" => "Product updated successfully"
            ]);
        } else {
            return response() -> json([
                "status" => false,
                "errors" => $validator -> errors()
            ]);
        }
    }

    public function destroy($id, Request $request) {

        $product = Product::find($id);

        if (empty($product)) {
                    $request -> session() -> flash("error", "Product not found");
            return response() -> json([
                "status" => false,
                "notFound" => true
            ]);
        }

        $product -> delete();
        // File::delete(public_path("uploads/product/large"));

            $request -> session() -> flash("success", "Product deleted successfully");

            return response() -> json([
                "status" => true,
                "message" => "Product deleted successfully"
            ]);

    }

}



