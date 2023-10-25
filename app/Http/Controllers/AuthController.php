<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Wishlist;
use App\Models\CustomerAddress;
use App\Models\Country;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;




class AuthController extends Controller
{
    public function login() {
        return view("front.account.login");
    }

    public function register () {
        return view("front.account.register");
    }

    public function processRegister(Request $request) {
            $validator = Validator::make($request -> all(),[
            "name" => "required|min:3", 
            "email" => "required|email|unique:users",
            "password" => "required|min:5|confirmed"
        ]);

        if ($validator -> passes()) {

            $user = new User;
            $user -> name = $request -> name;
            $user -> email = $request -> email;
            $user -> phone = $request -> phone;
            $user -> password = Hash::make($request -> password);
            $user -> save();


            session() -> flash("success", "You have been registred successfully.");

            return response() -> json([
                "status" => true,
            ]);
        } else{
            return response() -> json([
                "status" => false,
                "errors" => $validator -> errors()
            ]);
        }

    }

    public function authenticate(Request $request) {
        $validator = Validator::make($request -> all(),[
            "email" => "required|email",
            "password" => "required",
        ]);

        if ($validator -> passes()) {

            if (Auth::attempt(["email" => $request -> email, "password" => $request -> password], $request -> get("remember"))) {
            
                if(session() -> has("url.intended")) {
                    return redirect(session() -> get("url.intended"));
                }

                return redirect() -> route("account.profile");
            } else {
                // session() -> flash("error", "Email or Password is wrong");
                return redirect() -> route("account.login") 
                    -> withInput($request -> only("email"))
                    -> withInput($request -> only("password"))
                    -> with("error", "Email or Password is wrong");
            }
            
        } else {
            return redirect() -> route("account.login")
            -> withErrors($validator)
            -> withInput($request -> only("email"));
        }
    } 

    public function profile() {

        $userId = Auth::user() -> id;

        $countries = Country::orderBy("name","ASC") -> get();

        $user = User::where("id", $userId) -> first();

        $address = CustomerAddress::where("user_id", $userId);
 
        return view("front.account.profile", [
            "user" => $user,
            "countries" => $countries,
            "address" => $address,
        ]);
    }

    public function updateProfile(Request $request) {
        $userId = Auth::user() -> id;
        $validator = Validator::make($request -> all(), [
            "name" => "required|min:3",
            "email" => "required|email|unique:users,email,".$userId.",id",
            "phone" => "required|numeric|min:8"
        ]);

        if ($validator -> passes()) {

            $user = User::find($userId);
            $user -> name = $request -> name;
            $user -> email = $request -> email;
            $user -> phone = $request -> phone;
            $user -> save();
            session() -> flash("success","Profile updated successfully");

            return response() -> json([
                "status" => true,
                "message" => "Profile updated successfully."
            ]);

        } else {
            return response() -> json([
                "status" => false,
                "errors" => $validator -> errors()
            ]);
        }
    }

    public function updateAddress(Request $request){

        $userId = Auth::user()->id;

        $validator = Validator::make($request->all(), [
            "first_name" => "required|min:3",
            "last_name" => "required|min:3",
            "email" => "required|email",
            "mobile" => "required|numeric|min:8",
            "country_id" => "required",
            "address" => "required|min:8",
            "city" => "required",
            "zip" => "required",
            "apartment" => "nullable", 
            "state" => "nullable",     
        ]);

        if ($validator->passes()) {

            $address = CustomerAddress::where("user_id", $userId)->first();

            if (!$address) {

                $address = CustomerAddress::create([
                    "user_id" => $userId,
                    "first_name" => $request->first_name,
                    "last_name" => $request->last_name,
                    "email" => $request->email,
                    "mobile" => $request->mobile,
                    "country_id" => $request->country_id,
                    "address" => $request->address,
                    "apartment" => $request->apartment,
                    "city" => $request->city,
                    "state" => $request->state,
                    "zip" => $request->zip,
                ]);
            } else {

                $address->update([
                    "first_name" => $request->first_name,
                    "last_name" => $request->last_name,
                    "email" => $request->email,
                    "mobile" => $request->mobile,
                    "country_id" => $request->country_id,
                    "address" => $request->address,
                    "apartment" => $request->apartment,
                    "city" => $request->city,
                    "state" => $request->state,
                    "zip" => $request->zip,
                ]);
            }

            session()->flash("success", "Address updated successfully");

            return response()->json([
                "status" => true,
                "message" => "Address updated successfully."
            ]);
        } else {
            return response()->json([
                "status" => false,
                "errors" => $validator->errors()
            ]);
        }
    }


    public function logout() {
        Auth::logout();
        return redirect() -> route("account.login")
        -> with("success", "You successfully loged out !");  
    }

    public function wishlist() {
        $wishlists = Wishlist::where("user_id", Auth::user() -> id) -> with("product") -> get();
        $data = [];
        $data["wishlists"] = $wishlists;
        return view("front.account.wishlist",$data);
    }

    public function removeProductFromWishlist(Request $request) {
        $wishlist =Wishlist::where("user_id", AUth::user() -> id) -> where("product_id", $request -> id) -> first();
        if($wishlist == null) {

            session() -> flash("error", "Product already removed");

            return response() -> json([
                "status" => true,
            ]);
        } else {
            Wishlist::where("user_id", Auth::user() -> id) -> where("product_id", $request -> id) -> delete();
            session() -> flash("success", "Product removed successfully");
            return response() -> json([
                "status" => true,
            ]);
        }
    }

}
