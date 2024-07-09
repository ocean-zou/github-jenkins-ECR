<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    // 创建产品
    public function create(Request $request)
    {
        $product = $request->all();

        $result = Product::create(['productName' => $product['productName'],]);

        return response()->json($result);
    }

    // 获取所有产品
    public function index()
    {
        $products = Product::all();
        $productName = $products[0]['productName'];

        return view('welcome', [
            'productName'  => $productName,
        ]);
    }
}
