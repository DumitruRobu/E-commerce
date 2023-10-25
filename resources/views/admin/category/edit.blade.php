@extends("admin.layouts.app")

@section("content")
		<!-- Content Header (Page header) -->
        <section class="content-header">					
            <div class="container-fluid my-2">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Edit Category</h1>
                    </div>
                    <div class="col-sm-6 text-right">
                        <a href="{{ route("categories.index") }}" class="btn btn-primary">Back</a>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="container-fluid">
                <form action="{{ route('categories.store') }}" method="POST" id="categoryForm" name="categoryForm">
                    @csrf
                    @method("PUT")
                    <div class="card">
                        <div class="card-body">								
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="name">Name</label>
                                        <input type="text" name="name" id="name" class="form-control" 
                                        placeholder="Name" value="{{ $category -> name }}">
                                        <p></p>	
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="status">Status</label>
                                        <select name="status" id="status" class="form-control">
                                            <option {{ ($category -> status == 1) ? "selected" : "" }}
                                            value="1">Active</option>
                                            <option {{ ($category -> status == 0) ? "selected" : "" }}
                                            value="0">Block</option>    
                                        </select>	
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="category_image">Category Image</label>
                                        <input type="text" name="category_image" id="category_image" class="form-control" 
                                        placeholder="Category Image URL" value="{{ $category -> category_image }}">
                                        <p></p>	
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="status">Show on Home</label>
                                        <select name="showHome" id="showHome" class="form-control">
                                            <option {{ ($category -> showHome == "No") ? "selected" : "" }} value="No">No</option>  
                                            <option {{ ($category -> showHome == "Yes") ? "selected" : "" }} value="Yes">Yes</option>   
                                        </select>	
                                    </div>
                                </div>										
                            </div>
                        </div>							
                    </div>
                    <div class="pb-5 pt-3">
                        <button type="submit" class="btn btn-primary">Update</button>
                        <a href="{{ route("categories.index") }}" class="btn btn-outline-dark ml-3">Cancel</a>
                    </div>
                    </div>
                </form>
            <!-- /.card -->
        </section>
        <!-- /.content -->
@endsection

@section("customJs")

<script>
    $("#categoryForm").submit(function(event){
        event.preventDefault();
        var element = $(this);
        $.ajax({
            url: "{{ route('categories.update',$category -> id) }}",
            type: "put",
            data: element.serializeArray(),
            dataType: "json",
            success: function(response){
                if (response["status"] == true) {

                    window.location.href="{{ route('categories.index') }}";

                    $("#name").removeClass("is-invalid")
                    .siblings("p")
                    .removeClass("invalid-feedback").html("");
                } else {

                    if(response["notFound"] == true) {
                        window.location.href="{{ route('categories.index') }}";
                    }

                var errors = response["errors"];
                if(errors["name"]){
                    $("#name").addClass("is-invalid")
                    .siblings("p")
                    .addClass("invalid-feedback").html(errors["name"]);
                } else{
                   
                }
                }
                
            
            }, error: function(jqXHR, exeption){
                console.log("Something went wrong");
            }
        })
    });
    
</script>

@endsection

