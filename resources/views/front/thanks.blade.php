@extends('front.layouts.app')

@section("content")
<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="{{ route('front.home') }}">Home</a></li>
                <li class="breadcrumb-item"><a class="white-text" href="{{ route('front.shop') }}">Shop</a></li>
            </ol>
        </div>
    </div>
</section>
<section class="container">
    <div class="col-md-12 text-center py-5">

        @if (Session::has("success"))
           <div class="alert alert-success">
                {{ Session::get("success") }}
            </div> 
        @endif
        

        <h1>Thank You!</h1>
        <h1>Your Order Id is: {{ $id }}</h1>
    </div>
</section>
@endsection