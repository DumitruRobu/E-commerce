@extends("admin.layouts.app")

@section("content")

    	<!-- Content Header (Page header) -->
        <section class="content-header">
        <form action="" method="post" name="productForm" id="productForm">				
            <div class="container-fluid my-2">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Edit Product</h1>
                    </div>
                    <div class="col-sm-6 text-right">
                        <a href="{{ route("products.index") }}" class="btn btn-primary">Back</a>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-8">
                        <div class="card mb-3">
                            <div class="card-body">								
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="title">Title</label>
                                            <input type="text" name="title" id="title" class="form-control" placeholder="Title" value="{{ $product -> title }}">	
                                        <p class="error"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="description">Description</label>
                                            <textarea name="description" id="description" cols="90" rows="5" class="summernote" placeholder="Description" value="{{ $product -> description }}" required></textarea>
                                        </div>
                                    </div>                                            
                                </div>
                            </div>	                                                                      
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h2 class="h4 mb-3">Media</h2>
                                <div class="mb-3">
                                    <label for="main_image">Main Image</label>
                                    <input type="text" name="main_image" id="main_image" class="form-control" placeholder="Main Image URL" value="{{ $product -> main_image }}">
                                <p class="error"></p>
                                </div>
                                <div class="mb-3">
                                    <label for="additional_images">Additional Images</label>
                                    @for ($i = 0; $i < 4; $i++)
                                        <input
                                            type="text"
                                            name="additional_images[]"
                                            class="form-control"
                                            placeholder="Image URL"
                                            value="{{ isset($cleanedAdditionalImages[$i]) ? $cleanedAdditionalImages[$i] : '' }}"
                                        >
                                    @endfor
                                </div>                                
                            </div>
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h2 class="h4 mb-3">Pricing</h2>								
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="price">Price</label>
                                            <input type="text" name="price" id="price" class="form-control" placeholder="Price" value="{{ $product -> price }}">	
                                            <p class="error"></p>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <label for="compare_price">Compare at Price</label>
                                            <input type="text" name="compare_price" id="compare_price" class="form-control" placeholder="Compare Price" value="{{ $product -> compare_price }}">
                                            {{-- <p class="text-muted mt-3">
                                                To show a reduced price, move the product’s original price into Compare at price. Enter a lower value into Price.
                                            </p>	 --}}
                                        </div>
                                    </div>                                            
                                </div>
                            </div>	                                                                      
                        </div>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h2 class="h4 mb-3">Inventory</h2>								
                                <div class="row">  
                                    <div class="col-md-12">
                                        <div class="mb-3">
                                            <div class="custom-control custom-checkbox">
                                                <input type="hidden" name="track_qty" value="No">
                                                <input class="custom-control-input" type="checkbox" id="track_qty" name="track_qty" value="Yes" {{ ($product -> track_qty == "Yes") ? "checked" : "" }} >
                                                <label for="track_qty" class="custom-control-label">Track Quantity</label>
                                                <p class="error"></p>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <input type="number" min="0" name="qty" id="qty" class="form-control" placeholder="Qty" value="{{ $product -> qty }}">	
                                            <p class="error"></p>
                                        </div>
                                    </div>                                         
                                </div>
                            </div>	                                                                      
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-3">
                            <div class="card-body">	
                                <h2 class="h4 mb-3">Product status</h2>
                                <div class="mb-3">
                                    <select name="status" id="status" class="form-control">
                                        <option {{ ($product -> status == 1) ? "selected" : "" }} value="1">Active</option>
                                        <option {{ ($product -> status == 0) ? "selected" : "" }} value="0">Block</option>
                                    </select>
                                </div>
                            </div>
                        </div> 
                        <div class="card">
                            <div class="card-body">	
                                <h2 class="h4  mb-3">Product category</h2>
                                <div class="mb-3">
                                    <label for="category">Category</label>
                                    <select name="category" id="category" class="form-control">
                                        <option value="">Select a Category</option>
                                        @if($categories -> isNotEmpty())
                                            @foreach($categories as $category)
                                            <option {{ ($product -> category_id == $category -> id) ? "selected" : "" }} value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                    <p class="error"></p>
                                </div>
                                {{-- <div class="mb-3">
                                    <label for="category">Sub category</label>
                                    <select name="sub_category" id="sub_category" class="form-control">
                                        <option value="">Mobile</option>
                                        <option value="">Home Theater</option>
                                        <option value="">Headphones</option>
                                    </select>
                                </div> --}}
                            </div>
                        </div> 
                        <div class="card mb-3">
                            {{-- <div class="card-body">	
                                <h2 class="h4 mb-3">Product brand</h2>
                                <div class="mb-3">
                                    <select name="status" id="status" class="form-control">
                                        <option value="">Apple</option>
                                        <option value="">Vivo</option>
                                        <option value="">HP</option>
                                        <option value="">Samsung</option>
                                        <option value="">DELL</option>
                                    </select>
                                </div>
                            </div> --}}
                        </div> 
                        <div class="card mb-3">
                            <div class="card-body">	
                                <h2 class="h4 mb-3">Featured product</h2>
                                <div class="mb-3">
                                    <select name="is_featured" id="is_featured" class="form-control">
                                        <option {{ ($product -> is_featured == "No") ? "selected" : "" }} value="No">No</option>
                                        <option {{ ($product -> is_featured == "Yes") ? "selected" : "" }} value="Yes">Yes</option>                                                
                                    </select>
                                    <p class="error"></p>
                                </div>
                            </div>
                        </div>   
                        <div class="card mb-3">
                            <div class="card-body">	
                                <h2 class="h4 mb-3">Gender</h2>
                                <div class="mb-3">
                                    <select name="gender" id="gender" class="form-control">
                                        <option {{ ($product -> gender == "Male") ? "selected" : "" }} value="Male">Male</option>
                                        <option {{ ($product -> gender == "Female") ? "selected" : "" }} value="Female">Female</option>                                                
                                    </select>
                                    <p class="error"></p>
                                </div>
                            </div>
                        </div>                               
                    </div>
                </div>
                @csrf
                <div class="pb-5 pt-3">
                    <button type="submit" class="btn btn-primary">Update</button>
                    <a href="{{ route("products.index") }}" class="btn btn-outline-dark ml-3">Cancel</a>
                </div>
            </div>
        </form>	
            <!-- /.card -->
        </section>
        <!-- /.content -->

@endsection



@section("customJs")

<script>

$("#productForm").submit(function(event){
        event.preventDefault();
        formArray = $(this).serializeArray();
        $("button[type = 'submit']").prop("disabled",true);
        var csrfToken = $('meta[name="csrf-token"]').attr('content');
        var headers = {
            'X-CSRF-TOKEN': csrfToken
        };
        $.ajax({
            url: "{{ route('products.update', $product -> id) }}",
            type: "put",
            data: formArray,
            headers: headers,
            dataType: "json",
            success: function(response) {
                $("button[type = 'submit']").prop("disabled",false);
                if(response["status"] == true) {
                    $(".error").removeClass("invalid-feedback").html("");
                    $("input[type = 'text'], select, input[type = 'number']").removeClass("is-invalid");
                    window.location.href = "{{ route('products.index') }}";
                } else {
                    var errors = response["errors"];

                    $(".error").removeClass("invalid-feedback").html("");
                    $("input[type = 'text'], select, input[type = 'number']").removeClass("is-invalid");

                    $.each(errors, function(key,value) {
                        $(`#${key}`).addClass("is-invalid")
                        .siblings("p")
                        .addClass("invalid-feedback")
                        .html(value);
                    });

                }
            },
            error: function() {
                console.log("Something went wrong");
            }
        });


       


    });

</script>

@endsection








