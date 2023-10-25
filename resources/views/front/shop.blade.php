@extends("front.layouts.app")

@section("content")

<section class="section-5 pt-3 pb-3 mb-3 bg-white">
    <div class="container">
        <div class="light-font">
            <ol class="breadcrumb primary-color mb-0">
                <li class="breadcrumb-item"><a class="white-text" href="{{ route('front.home') }}">Home</a></li>
                <li class="breadcrumb-item active">Shop</li>
            </ol>
        </div>
    </div>
</section>
<section class="section-6 pt-5">
    <form action="{{ route('front.shop') }}" method="GET">
        <div class="container">
            <div class="row">
                <div class="col-md-3 sidebar">
                    <div class="sub-title">
                        <h2>Categories</h3>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <select class="form-control" id="category" name="category">
                                <option value="">All</option>
                                @foreach($categories as $category)
                                <option value="{{ $category->name }}" {{ $selectedCategory == $category->name ? 'selected' : '' }}>
                                    {{ $category->name }}
                                </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="sub-title mt-5">
                        <h2>Gender</h3>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="gender" value="male" id="male" {{ $selectedGender == 'male' ? 'checked' : '' }}>
                                <label class="form-check-label" for="male">Male</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="gender" value="female" id="female" {{ $selectedGender == 'female' ? 'checked' : '' }}>
                                <label class="form-check-label" for="female">Female</label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group mt-3">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                    <div class="form-group mt-3">
                        <button type="button" class="btn btn-primary" onclick="window.location.href='{{ route("front.shop") }}'">Reset</button>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="row pb-3">
                        <div class="col-12 pb-1">
                            <div class="d-flex align-items-center justify-content-end mb-4">
                                <div class="card-tools">
                                    <div class="input-group input-group" style="width: 250px; right: 10%;">
                                        <input value="{{ Request::get("keyword") }}" type="text" name="keyword" class="form-control float-right" placeholder="Search For Products">
                                        <div class="input-group-append" style="margin-left: -2px">
                                          <button type="submit" class="btn btn-default" style="background-color: lightgreen; border: none; padding-bottom: 8px;">
                                            <i class="fas fa-search"></i>
                                          </button>
                                        </div>
                                      </div>
                                </div>
                                <div class="ml-2">
                                        {{-- Sort --}}
                                    <select name="sort" id="sort" class="form-control">
                                        <option value="name_asc" {{ $selectedSort == 'name_asc' ? 'selected' : '' }}>A-Z</option>
                                        <option value="name_desc" {{ $selectedSort == 'name_desc' ? 'selected' : '' }}>Z-A</option>
                                        <option value="price_asc" {{ $selectedSort == 'price_asc' ? 'selected' : '' }}>Price Low</option>
                                        <option value="price_desc" {{ $selectedSort == 'price_desc' ? 'selected' : '' }}>Price High</option>
                                        <option value="latest" {{ $selectedSort == 'latest' ? 'selected' : '' }}>Latest</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                           {{-- Products --}}
                        @if(!empty($products))
                        @foreach( $products as $product )
                        <div class="col-md-4">
                            <div class="card product-card">
                                <div class="product-image position-relative">
                                    <a href="{{ route("front.product", $product->id) }}" class="product-img"><img class="card-img-top" src="{{ $product->main_image }}" alt=""></a>
                                    <a onclick="addToWishlist({{ $product -> id }})" class="whishlist" href="javascript:void(0);"><i class="far fa-heart" style="color: rgb(231, 109, 109)"></i></a>                            


                                    <div class="product-action">
                                        <a class="btn btn-dark" href="javascript:void(0);" onclick="addToCart({{ $product -> id }});">
                                            <i class="fa fa-shopping-cart"></i> Add To Cart
                                        </a>
                                    </div>
                                </div>
                                <div class="card-body text-center mt-3">
                                    <a class="h6 link" href="{{ route("front.product", $product->id) }}"
                                        style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis; max-width: 100%; display: block;">{{ Str::limit($product->title, 30, '...') }}</a>
                                    <div class="price mt-2">
                                        <span class="h5"><strong>{{ $product->price }}MDL</strong></span>
                                        @if($product->compare_price > 0)
                                        <span class="h6 text-underline"><del>{{ $product->compare_price }}MDL</del></span>
                                        @else
                                        <span class="h6 text-underline">&nbsp;</span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                        @endif
                    </div>

                    <div class="col-md-12 pt-5">
                         {{-- Pagination --}}
                    {{ $products -> links() }}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
{{-- //////////////////////////////////////// --}}
@section("customJs")
<script>
    $(document).ready(function () {
        // Get the URL parameters
        var urlParams = new URLSearchParams(window.location.search);
        const selectedCategory = urlParams.get('category');
        const selectedGender = urlParams.get('gender');
        const selectedSort = urlParams.get('sort');

        // Set the selected category based on URL parameter
        if (selectedCategory) {
            $("#category").val(selectedCategory);
        }

        // Set the selected gender based on URL parameter
        if (selectedGender) {
            $("input[name='gender']").prop('checked', false);
            $("input[name='gender'][value='" + selectedGender + "']").prop('checked', true);
        }

        // Set the selected sort based on URL parameter
        if (selectedSort) {
            $("#sort").val(selectedSort);
        }

        // Add event listeners to update the URL when filters change
        $("#category, input[name='gender'], #sort").on("change", function () {
            updateURL();
        });

        // Function to update the URL with current filter selections
        function updateURL() {
            var selectedCategory = $("#category").val();
            var selectedGender = $("input[name='gender']:checked").val();
            var selectedSort = $("#sort").val();

            var url = "{{ route('front.shop') }}";

            if (selectedCategory) {
                url += "?category=" + selectedCategory;
            }

            if (selectedGender) {
                if (url.includes("?")) {
                    url += "&gender=" + selectedGender;
                } else {
                    url += "?gender=" + selectedGender;
                }
            }

            if (selectedSort) {
                if (url.includes("?")) {
                    url += "&sort=" + selectedSort;
                } else {
                    url += "?sort=" + selectedSort;
                }
            }

            window.history.replaceState(null, null, url);
        }
    });
</script>
@endsection
