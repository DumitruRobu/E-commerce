<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ImportantLinksController extends Controller
{
    public function about() {
        return view("front.about");
    }

    public function contact() {
        return view("front.contact");
    }
}
