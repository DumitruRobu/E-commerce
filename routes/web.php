<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\admin\AdminLoginController;
use App\Http\Controllers\admin\HomeController;
use App\Http\Controllers\admin\CategoryController;
use App\Http\Controllers\admin\ProductController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\FrontController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ImportantLinksController;
use Illuminate\Http\Request;

Route::get("/", [FrontController::class, "index"]) -> name("front.home");
Route::get("/shop", [ShopController::class, "index"])->name("front.shop");
Route::get('/shop/{category}', [ShopController::class, 'shopByCategory'])->name('front.shop.category');

Route::get("/product/{id}", [ShopController::class, "product"])->name("front.product");
Route::get("/cart", [CartController::class, "cart"]) -> name("front.cart");
Route::post("/add-to-cart", [CartController::class, "addToCart"]) -> name("front.addToCart");
Route::post("/update-cart", [CartController::class, "updateCart"]) -> name("front.updateCart");
Route::post("/delete-item", [CartController::class, "deleteItem"]) -> name("front.deleteItem.cart");
Route::get("/checkout", [CartController::class, "checkout"]) -> name("front.checkout");
Route::post("/process-checkout", [CartController::class, "processCheckout"]) -> name("front.processCheckout");
Route::get("/thanks/{orderId}", [CartController::class, "thankyou"]) -> name("front.thankyou");
Route::post("/add-to-wishlist/{productId", [FrontController::class, "addToWishlist"]) -> name("front.addToWishlist");

Route::get("/about", [ImportantLinksController::class, "about"]) -> name("front.about");
Route::get("/contact", [ImportantLinksController::class, "contact"]) -> name("front.contact");



Route::get("/register",[AuthController::class, "register"]) -> name("account.register");
Route::post("/process-register",[AuthController::class, "processRegister"]) -> name("account.processRegister");


Route::group(["prefix" => "account"], function(){
    Route::group(["middleware" => "guest"], function(){

        Route::get("/login",[AuthController::class, "login"]) -> name("account.login");
        Route::post("/login",[AuthController::class, "authenticate"]) -> name("account.authenticate");

        Route::get("/register",[AuthController::class, "register"]) -> name("account.register");
        Route::post("/process-register",[AuthController::class, "processRegister"]) -> name("account.processRegister");
    
    });

    Route::group(["middleware" => "auth"], function(){
        Route::get("/profile",[AuthController::class, "profile"]) -> name("account.profile");
        Route::post("/update-profile",[AuthController::class, "updateProfile"]) -> name("account.updateProfile");
        Route::post("/update-address",[AuthController::class, "updateAddress"]) -> name("account.updateAddress");
        Route::get("/my-wishlist",[AuthController::class, "wishlist"]) -> name("account.wishlist");
        Route::post("/remove-product-from-wishlist",[AuthController::class, "removeProductFromWishlist"]) -> name("account.removeProductFromWishlist");
        Route::get("/logout",[AuthController::class, "logout"]) -> name("account.logout");
    });
});

Route::group(["prefix" => "admin"], function(){

    Route::group(["middleware" => "admin.guest"], function(){

        Route::get("/login", [AdminLoginController::class,"index"]) -> name("admin.login");
        Route::post("/authenticate", [AdminLoginController::class,"authenticate"]) -> name("admin.authenticate");

    });

    Route::group(["middleware" => "admin.auth"], function(){

        Route::get("/dashboard", [HomeController::class,"index"]) -> name("admin.dashboard");
        Route::get("/logout", [HomeController::class,"logout"]) -> name("admin.logout");

        // Category Routes
        Route::get("/categories", [CategoryController::class, "index"]) -> name("categories.index");
        Route::get("/categories/create", [CategoryController::class, "create"]) -> name("categories.create");
        Route::post("/categories", [CategoryController::class, "store"]) -> name("categories.store");
        Route::get("/categories/{category}/edit", [CategoryController::class, "edit"]) -> name("categories.edit");
        Route::put("/categories/{category}", [CategoryController::class, "update"]) -> name("categories.update");
        Route::delete("/categories/{category}", [CategoryController::class, "destroy"]) -> name("categories.delete");

        //Product Routes
        Route::get("/products", [ProductController::class,"index"]) -> name("products.index");
        Route::get("/products/create", [ProductController::class,"create"]) -> name("products.create");
        Route::post("/products", [ProductController::class,"store"]) -> name("products.store");
        Route::get("/products/{product}", [ProductController::class, "edit"]) -> name("products.edit");
        Route::put("/products/{product}", [ProductController::class, "update"]) -> name("products.update");
        Route::delete("/products/{product}", [ProductController::class, "destroy"]) -> name("products.delete");


        //User routes
        Route::get("/users", [UserController::class, "index"]) -> name("users.index");
        Route::get("/users/create", [UserController::class, "create"]) -> name("users.create");
        Route::post("/users", [UserController::class, "store"]) -> name("users.store");
        Route::get("/users/{user}/edit", [UserController::class, "edit"]) -> name("users.edit");
        Route::put("/users/{user}", [UserController::class, "update"]) -> name("users.update");
        Route::delete("/users/{user}", [UserController::class, "destroy"]) -> name("users.delete");
    });
});




