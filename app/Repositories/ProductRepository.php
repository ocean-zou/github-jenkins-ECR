<?php

namespace App\Repositories;

use App\Models\Product;

class ProductRepository
{
    public function getProductById($id) 
    {
        return Product::where('id', '=', $id)->get();
    }

    public function createProduct(array $productData) 
    {
        return Product::create($productData);
    }

    public function updateProduct($id, array $productData) 
    {
        return Product::whereId($id)->update($productData);
    }
}