class ConstantStrings {
  static String appTitle = 'G Projukti';
  static String searchHint = 'Search what you want...';

  //APIs
  static String baseUrl = 'https://testapi.gprojukti.com/api/v1.0/';
  static String homeCategoryUrl = 'catalog/public/product-groups';
  static String subCategoryProductsListUrl = 'products/public/product-list';

  static String htmlPrefix = '''
  <!DOCTYPE html>
    <html>
      <head>
      <style>
      img{
        width:100% !important;
      }
      </style>
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      </head>
      <body>
        <div style="margin-left: 15px; margin-right: 15px;">
      ''';
  static String htmlPostFix = '''
  </div>
  </body>
  </html>
  ''';

}
