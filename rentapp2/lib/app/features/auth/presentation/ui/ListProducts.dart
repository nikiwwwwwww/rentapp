import 'package:flutter/material.dart';
import 'package:rentapp2/app/di/service.dart';
import 'package:rentapp2/app/features/auth/data/model/CategoryClass.dart';
import 'package:rentapp2/app/features/auth/data/model/PhotoClass.dart';
import 'package:rentapp2/app/features/auth/data/model/ProductClass.dart';
import 'package:rentapp2/app/features/auth/data/repository/Catrgories.dart';
import 'package:rentapp2/app/features/auth/data/repository/Photo.dart';
import 'package:rentapp2/app/features/auth/data/repository/Products.dart';
import 'package:rentapp2/app/routes/router_utils.dart';

class ListProduct extends StatefulWidget {
  @required
  final String id;

  ListProduct(this.id);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  ProductRepository productRepository = service();

  CategoryRepository categoriesRepository = service();

  PhotoRepository photoRepository = service();

  List<ProductClass> products = [];

  List<PhotoClass> photos = [];

  CategoryClass? category;

  @override
  void initState(){
    super.initState();

    getListProductsCategory();
    getCategory();
  }

  Future<void> getCategory() async {
    category = await categoriesRepository.getCategoryById(int.parse(widget.id));
    setState(() {});
  }

  Future<void> getListProductsCategory() async {
    List<ProductClass> allProducts = await productRepository.getAllProducts();
    for(final product in allProducts){
      if (product.categoryId == int.parse(widget.id))
      {
        products.add(product);
      }
    }
    photos = await photoRepository.getAllPhotos();
    setState(() {});
  }



@override
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(category?.categoryName ?? 'category'),
      
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final result = await showSearch(
                context: context,
                delegate: CustomSearchDelegate(products),
              );

              if (result != null) {
                // Do something with the result
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16.0),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                ProductClass product = products[index];
                return ProductCard(product: product, photos: photos,);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final ProductClass product;
  final List<PhotoClass> photos;

  ProductCard({required this.product, required this.photos});

  
  PhotoClass? photo (ProductClass product, List<PhotoClass> photos){
    for  (var i in photos) {
      if (i.productId == product.idProduct){
        return i;
      }
    }
  }
  
 


    @override
    Widget build(BuildContext context) {
      return Card(
        child: Column(
          children: [

            Image.network(photo(product, photos)!.photo.toString()),
            Text(product.nameProduct),
            //Text('\$${product.price}'),
            Text('\$${''}'),
          ],
        ),
      );
    }
}



class CustomSearchDelegate extends SearchDelegate<ProductClass> {
  final List<ProductClass> products;

  CustomSearchDelegate(this.products);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.popUntil(context, ModalRoute.withName(Pages.home.screenPath));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? products
        : products
            .where((product) => product.nameProduct.contains(query))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index].nameProduct),
          onTap: () {
            close(context, suggestionList[index]);
          },
        );
      },
    );
  }
}
