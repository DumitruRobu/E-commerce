<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Product;
use App\Models\ProductImage;

class PopulateProductImages extends Command
{
    protected $signature = 'populate:product-images';

    protected $description = 'Populate product_images table with additional images';

    public function __construct()
    {
        parent::__construct();
    }

    // ...
public function handle()
{
    // Get all products
    $products = Product::all();

    // Loop through products and create records in product_images for additional images
    foreach ($products as $product) {
        // Assuming you have a column named 'additional_images' in your products table
        $additionalImages = json_decode($product->additional_images, true);

        // Check if additional images exist for this product
        if (!empty($additionalImages)) {
            foreach ($additionalImages as $imageUrl) {
                if ($imageUrl !== null) { // Skip null entries
                    ProductImage::create([
                        'product_id' => $product->id,
                        'image_url' => $imageUrl,
                    ]);
                }
            }
        }
    }

    $this->info('Product images populated successfully.');
}


}
