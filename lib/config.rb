SALES_ENGINE_ENV ||= 'development'

DATA = {

  'CustomerRepository' => {
    'development' => File.read('data/customers.csv'),
    'test' =>
%q{id,first_name,last_name,created_at,updated_at
1,Joey,Ondricka,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC
2,Cecelia,Osinski,2012-03-27 14:54:10 UTC,2012-03-27 14:54:10 UTC
3,Mariah,Toy,2012-03-27 14:54:10 UTC,2012-03-27 14:54:10 UTC}
  },

  'InvoiceRepository' => {
    'development' => File.read('data/invoices.csv'),
    'test' =>
%q{id,customer_id,merchant_id,status,created_at,updated_at
1,1,26,shipped,2012-03-25 09:54:09 UTC,2012-03-25 09:54:09 UTC
2,1,75,shipped,2012-03-12 05:54:09 UTC,2012-03-12 05:54:09 UTC
3,1,78,shipped,2012-03-10 00:54:09 UTC,2012-03-10 00:54:09 UTC}
  },

  'ItemRepository' => {
    'development' => File.read('data/items.csv'),
    'test' =>
%q{id,name,description,unit_price,merchant_id,created_at,updated_at
1,Item Qui Esse,Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.,75107,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
2,Item Autem Minima,Cumque consequuntur ad. Fuga tenetur illo molestias enim aut iste. Provident quo hic aut. Aut quidem voluptates dolores. Dolorem quae ab alias tempora.,67076,1,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
3,Item Adipisci Sint,Iure cumque laborum hic autem quidem voluptas. Quis eum adipisci neque magnam. Commodi molestiae exercitationem.,22951,2,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC}
  },

  'MerchantRepository' => {
    'development' => File.read('data/merchants.csv'),
    'test' =>
%q{id,name,created_at,updated_at
1,Schroeder-Jerde,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
2,"Klein, Rempel and Jones",2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC
3,Willms and Sons,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC}
  }
}
