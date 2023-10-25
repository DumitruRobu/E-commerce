@extends('admin.layouts.app')

@section('content')

    <!-- Content Header (Page header) -->
    <section class="content-header">					
        <div class="container-fluid my-2">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>Products</h1>
                </div>
                <div class="col-sm-6 text-right">
                    <a href="{{ route("products.create") }}" class="btn btn-primary">New Product</a>
                </div>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- Main content -->
    <section class="content">
        <!-- Default box -->
        <div class="container-fluid">
            @include("admin.message")
            <div class="card">
                <form action="" method="GET">
                    <div class="card-header">
                        <div class="card-title">  
                            <button type="button" onclick="window.location.href='{{ route("products.index") }}'" class="btn btn-default btn-sm">Reset</button>
                        </div>
                   <div class="card-tools">
                    <div class="input-group input-group" style="width: 250px;">
                        <input value="{{ Request::get("keyword") }}" type="text" name="keyword" class="form-control float-right" placeholder="Search">
    
                        <div class="input-group-append">
                          <button type="submit" class="btn btn-default">
                            <i class="fas fa-search"></i>
                          </button>
                        </div>
                      </div>
                </div> 
                </div>
                </form>
                <div class="card-body table-responsive p-0">								
                    <table class="table table-hover text-nowrap">
                        <thead>
                            <tr>
                                <th width="60">ID</th>
                                <th width="80"></th>
                                <th>Product</th>
                                <th>Gender</th>
                                <th>Price</th>
                                <th>Qty</th>
                                <th width="100">Status</th>
                                <th width="100">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @if($products -> isNotEmpty())
                                @foreach($products as $product)
                                <tr>
                                    <td>{{ $product -> id }}</td>
                                    {{-- <td><img src="img/product-1.jpg" class="img-thumbnail" width="50" ></td> --}}
                                    <td><img src="{{ $product->main_image }}" alt="Main Image" class="img-thumbnail" width="50"></td>
                                    <td><a href="#">{{ $product -> title }}</a></td>
                                    <td>{{ $product -> gender }}</td>
                                    <td>{{ $product -> price }}MDL</td>
                                    <td>{{ $product -> qty }} left in Stock</td>
                                    <td>
                                        @if($product -> status == 1)
                                        <i class="fas fa-check-circle text-success"></i> Active
                                        @else
                                        <i class="fas fa-times-circle text-danger"></i> Blocked
                                        @endif
                                        
                                    </td>
                                    <td>
                                        <div class="btn-group">
                                            <a href="{{ route("products.edit", $product -> id) }}" class="btn btn-info btn-sm">
                                                <i class="fas fa-edit"></i> Edit
                                            </a>
                                            <button onclick="deleteProduct({{ $product -> id }})" class="btn btn-danger btn-sm">
                                                <i class="fas fa-trash"></i> Delete
                                            </button>
                                        </div>
                                    </td>
                                @endforeach
                            @else
                                <tr>
                                    <td>Records not found</td>
                                </tr>
                            @endif

                            
                        </tbody>
                    </table>										
                </div>
                <div class="card-footer clearfix">
                    {{ $products -> links() }}
                </div>
            </div>
        </div>
        <!-- /.card -->
    </section>
    <!-- /.content -->

@endsection

@section('customJs')
    <script>
    function deleteProduct(id) {
        var url = "{{ route('products.delete', ':id') }}";
        url = url.replace(':id', id);

        if (confirm("Are you sure you want to delete?")) {
            $.ajax({
                url: url,
                type: "DELETE",
                data: {
                    _token: $("meta[name='csrf-token']").attr("content")
                },
                dataType: "json",
                success: function(response) {
                    if (response["status"]) {
                        window.location.href = "{{ route('products.index') }}";
                    } else {
                        // Handle error if needed
                    }
                },
            });
        }
    }
    </script>
@endsection





















