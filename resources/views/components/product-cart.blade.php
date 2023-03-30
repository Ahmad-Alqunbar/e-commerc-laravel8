<div class="col-lg-3 col-md-6 col-12">
    <!-- Start Single Product -->
    <div class="single-product">
        <div class="product-image">
            <img src="{{asset('assets/images/products/product-3.jpg')}}" alt="#">
            <div class="button">
                <a href="product-details.html" class="btn"><i class="lni lni-cart"></i> Add to Cart</a>
            </div>
        </div>
        <div class="product-info">
            <span class="category">{{$product->catrgory->name}}</span>
            <h4 class="title">
                <a href="product-grids.html">{{$product->name}}</a>
            </h4>
            <ul class="review">
                <li><i class="lni lni-star-filled"></i></li>
                <li><i class="lni lni-star-filled"></i></li>
                <li><i class="lni lni-star-filled"></i></li>
                <li><i class="lni lni-star-filled"></i></li>
                <li><i class="lni lni-star-filled"></i></li>
                <li><span>5.0 Review(s)</span></li>
            </ul>
            <div class="price">
                <span>${{$product->price}}</span>
            </div>
        </div>
    </div>
    <!-- End Single Product -->
</div>