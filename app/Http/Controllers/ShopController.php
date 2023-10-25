<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class ShopController extends Controller
{
    public function index(Request $request) {
        $selectedCategory = $request->input('category');
        $selectedSort = $request->input('sort');
        $selectedGender = $request->input('gender');
        $categories = Category::orderBy("name", "ASC")->where("status", 1)->get();
        $products = Product::where("status", 1);
        if($request->has('keyword')) {
            $keyword = $request->input('keyword');
            $products = $products->where('title', 'like', '%' . $keyword . '%'); }
        if (!empty($selectedCategory)) {
            $category = Category::where("name", $selectedCategory)->first();
            if ($category) {
                $products = $products->where("category_id", $category->id); }  }
        if (!empty($selectedGender)) {
            $products = $products->where("gender", $selectedGender); }
        switch ($selectedSort) {
            case 'name_asc': $products = $products->orderBy("title", "ASC"); break;
            case 'name_desc': $products = $products->orderBy("title", "DESC"); break;
            case 'price_asc': $products = $products->orderBy("price", "ASC"); break;
            case 'price_desc': $products = $products->orderBy("price", "DESC"); break;
            case 'latest': $products = $products->orderBy("created_at", "DESC"); break;
            default: $products = $products->orderBy("title", "ASC"); break;
        }
        $products = $products->paginate(15);
        $data = [
            "categories" => $categories,
            "products" => $products,
            "selectedCategory" => $selectedCategory,
            "selectedGender" => $selectedGender,
            "selectedSort" => $selectedSort ];
        return view("front.shop", $data);
    }


public function product($id) {
    $product = Product::find($id);

    if (!$product) {
        abort(404);
    }

    $data['product'] = $product;

    return view("front.product", $data);
}

public function shopByCategory($categoryId) {
    $products = Product::where('category_id', $categoryId)->get();
    return view('front.shop', ['products' => $products]);
}

public function someControllerMethod(Request $request) {
    $categoryId = $request->input('category_id');
    $category = Category::find($categoryId);

    if (!$category) {
        return redirect()->route('front.shop')->with('error', 'Category not found');
    }

    $products = Product::where('category_id', $categoryId)->get();

    return view('front.shop', ['category' => $category, 'products' => $products]);
}



}

