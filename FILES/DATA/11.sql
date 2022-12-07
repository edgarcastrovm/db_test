
-- order items
CREATE TABLE order_items
  (
    order_id   NUMBER( 12, 0 )                                , -- fk
    item_id    NUMBER( 12, 0 )                                ,
    product_id NUMBER( 12, 0 ) NOT NULL                       , -- fk
    quantity   NUMBER( 8, 2 ) NOT NULL                        ,
    unit_price NUMBER( 8, 2 ) NOT NULL                        ,
    CONSTRAINT pk_order_items 
      PRIMARY KEY( order_id, item_id ),
    CONSTRAINT fk_order_items_products 
      FOREIGN KEY( product_id )
      REFERENCES products( product_id ) 
      ON DELETE CASCADE,
    CONSTRAINT fk_order_items_orders 
      FOREIGN KEY( order_id )
      REFERENCES orders( order_id ) 
      ON DELETE CASCADE
  );