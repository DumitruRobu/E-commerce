@extends("front.layouts.app")

@section("content")
<section class="section-1">
    <div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="false">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="images/carousel-1.jpg" class="d-block w-100" alt="">
                <picture>
                    <source media="(max-width: 799px)" srcset="https://www.studentdoctor.net/wp-content/uploads/2018/08/20180807_suit_752200423.png" />
                    <source media="(min-width: 800px)" srcset="https://www.studentdoctor.net/wp-content/uploads/2018/08/20180807_suit_752200423.png" />
                    <img src="https://www.studentdoctor.net/wp-content/uploads/2018/08/20180807_suit_752200423.png" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 text-white mb-3">Men's Fashion</h1>
                        <p class="mx-md-5 px-5">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3" href="{{ route('front.shop') }}">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/carousel-2.jpg" class="d-block w-100" alt="">
                <picture>
                    <source media="(max-width: 799px)" srcset="{{ asset("front-assets/images/carousel-2-m.jpg") }}" />
                    <source media="(min-width: 800px)" srcset="{{ asset("front-assets/images/carousel-2.jpg") }}" />
                    <img src="{{ asset("front-assets/images/carousel-1.jpg") }}" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 text-white mb-3">Women's Fashion</h1>
                        <p class="mx-md-5 px-5">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3" href="{{ route('front.shop') }}">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/carousel-3.jpg" class="d-block w-100" alt="">
                <picture>
                    <source media="(max-width: 799px)" srcset="https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" />
                    <source media="(min-width: 800px)" srcset="https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" />
                    <img src="https://images.pexels.com/photos/291762/pexels-photo-291762.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 text-white mb-3">Shop Online for up to 70% Off Branded Clothes</h1>
                        <p class="mx-md-5 px-5">Lorem rebum magna amet lorem magna erat diam stet. Sadips duo stet amet amet ndiam elitr ipsum diam</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3" href="{{ route('front.shop') }}">Shop Now</a>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <img src="images/OFC_OFC_REPLICATE_SLIDER.png" class="d-block w-100" alt="">
                <picture>
                    <source media="(max-width: 799px)" srcset="{{ asset("front-assets/images/OFC_OFC_REPLICATE_SLIDER.png") }}" />
                    <source media="(min-width: 800px)" srcset="{{ asset("front-assets/images/OFC_OFC_REPLICATE_SLIDER.png") }}" />
                    <img src="{{ asset("front-assets/images/OFC_OFC_REPLICATE_SLIDER.png") }}" alt="" />
                </picture>

                <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
                    <div class="p-3">
                        <h1 class="display-4 text-white mb-3">BEST ONLINE CLOTHES SHOP</h1>
                        <p class="mx-md-5 px-5">Lorem ipsum dolor sit amet consectetur adipisicing elit. Voluptatum iste quos error, rerum optio harum sapiente dolorum accusantium?</p>
                        <a class="btn btn-outline-light py-2 px-4 mt-3" href="{{ route('front.shop') }}">Shop Now</a>
                    </div>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>
<section class="section-2">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="box shadow-lg">
                    <div class="fa icon fa-check text-primary m-0 mr-3"></div>
                    <h2 class="font-weight-semi-bold m-0">Quality Product</h5>
                </div>                    
            </div>
            <div class="col-lg-3 ">
                <div class="box shadow-lg">
                    <div class="fa icon fa-shipping-fast text-primary m-0 mr-3"></div>
                    <h2 class="font-weight-semi-bold m-0">Free Shipping</h2>
                </div>                    
            </div>
            <div class="col-lg-3">
                <div class="box shadow-lg">
                    <div class="fa icon fa-exchange-alt text-primary m-0 mr-3"></div>
                    <h2 class="font-weight-semi-bold m-0">14-Day Return</h2>
                </div>                    
            </div>
            <div class="col-lg-3 ">
                <div class="box shadow-lg">
                    <div class="fa icon fa-phone-volume text-primary m-0 mr-3"></div>
                    <h2 class="font-weight-semi-bold m-0">24/7 Support</h5>
                </div>                    
            </div>
        </div>
    </div>
</section>
<section class="section-3">
    <div class="container">
        <div class="section-title">
            <h2>Categories</h2>
        </div>
        <div class="row pb-3">
            @if (getCategories()->isNotEmpty())
                @foreach(getCategories() as $category)
                    <div class="col-lg-3">
                        <div class="cat-card" data-category="{{ $category->id }}">
                            {{-- <a href="{{ route('front.shop', ['category' => $category->name]) }}" style="text-decoration: none;"> --}}
                                <div class="left">
                                    <a href="{{ route('front.shop', ['category' => $category->name]) }}" style="text-decoration: none;">
                                    @if($category->category_image != "")
                                        <img src="{{ $category->category_image }}" alt="" class="img-fluid">
                                    @endif
                                </a>
                                </div>
                                {{-- <a href="{{ route('front.shop', ['category' => $category->name]) }}" style="text-decoration: none;"> --}}
                                <div class="right">
                                    <a href="{{ route('front.shop', ['category' => $category->name]) }}" style="text-decoration: none;">
                                    <div class="cat-data" style="color: rgb(0, 29, 61)">
                                        <h2>{{ $category->name }}</h2>
                                    </div>
                                    </a>
                                </div>
                            {{-- </a> --}}
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
    
    
    
        
    </div>
</section>

<section class="section-4 pt-5">
    <div class="container">
        <div class="section-title">
            <h2>Featured Products</h2>
        </div> 
        <div class="row pb-3"> 
            @if($featuredProducts -> isNotEmpty())
            @foreach( $featuredProducts as $product ) 
            <div class="col-md-3">
                <div class="card product-card">
                    <div class="product-image position-relative">
                        <a href="{{ route("front.product", $product->id) }}" class="product-img"><img class="card-img-top" src="{{ $product -> main_image }}" alt=""></a>
                        
                        <a onclick="addToWishlist({{ $product -> id }})" class="whishlist" href="javascript:void(0);"><i class="far fa-heart" style="color: rgb(231, 109, 109)"></i></a>                            

                        <div class="product-action">
                            <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{ $product -> id }});">
                                <i class="fa fa-shopping-cart"></i> Add To Cart
                            </a>                            
                        </div>
                    </div>                        
                    <div class="card-body text-center mt-3">
                        <a class="h6 link" href="{{ route("front.product", $product->id) }}">{{ $product -> title }}</a>
                        <div class="price mt-2">
                            <span class="h5"><strong>{{ $product -> price }}MDL</strong></span>
                            @if($product -> compare_price > 0)
                            <span class="h6 text-underline"><del>{{ $product -> compare_price }}MDL</del></span>
                            @endif
                        </div>
                    </div>                        
                </div>                                               
            </div>  
            @endforeach
            @endif 
        </div>
    </div>
</section>

<section class="section-4 pt-5">
    <div class="container">
        <div class="section-title">
            <h2>Latest Produsts</h2>
        </div>    
        <div class="row pb-3">
            @if($latestProducts -> isNotEmpty())
            @foreach( $latestProducts as $product ) 
            <div class="col-md-3">
                <div class="card product-card">
                    <div class="product-image position-relative">
                        <a href="{{ route("front.product", $product->id) }}" class="product-img"><img class="card-img-top" src="{{ $product -> main_image }}" alt=""></a>
                       
                        <a onclick="addToWishlist({{ $product -> id }})" class="whishlist" href="javascript:void(0);"><i class="far fa-heart" style="color: rgb(231, 109, 109)"></i></a>                            

                        <div class="product-action">
                            <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{ $product -> id }});">
                                <i class="fa fa-shopping-cart"></i> Add To Cart
                            </a>                            
                        </div>
                    </div>                        
                    <div class="card-body text-center mt-3">
                        <a class="h6 link" href="{{ route("front.product", $product->id) }}">{{ $product -> title }}</a>
                        <div class="price mt-2">
                            <span class="h5"><strong>{{ $product -> price }}MDL</strong></span>
                            @if($product -> compare_price > 0)
                            <span class="h6 text-underline"><del>{{ $product -> compare_price }}MDL</del></span>
                            @endif
                        </div>
                    </div>                        
                </div>                                               
            </div>  
            @endforeach
            @endif                
        </div>
    </div>
</section>
@endsection

@section("customJs")
<script type="text/javascript">
    $(document).ready(function () {
        $(".cat-card").on("click", function () {
            const categoryId = $(this).data("category");
            
            if (categoryId !== undefined && categoryId !== null) {
                window.location.href = "{{ route('front.shop') }}?category=" + categoryId;
            }
        });
    });
    
</script>
@endsection

