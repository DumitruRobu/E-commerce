<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'price',
        'main_image',
        'additional_images',
        'compare_price',
        'track_qty',
        'qty',
        'status',
        'category_id',
        'is_featured',
        "gender"
    ];

    public function product_images() {
        return $this -> hasMany(ProductImage::class);
    }

    
}
