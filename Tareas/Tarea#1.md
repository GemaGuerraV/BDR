## Tarea #1
### Universidad de Ciencias Físico Matemáticas
#### Maestría en Ciencia de Datos - Bases de Datos Relacionales

La base de datos que elegí para trabajar en el tetramestre es sobre **DataCo Smart Supply Chain Dataset** la cual está diseñada para simular las operaciones de una cadena de suministro global de una empresa ficticia. Esta base de datos es especialmente útil para realizar análisis relacionados con logística, operaciones, atención al cliente y rendimiento en la entrega de productos. Contiene aproximadamente 1 millón de registros.

Dentro de esta base de datos se incluye información detallada sobre los pedidos realizados por clientes en diferentes partes del mundo. Cada registro abarca múltiples variables relevantes como el número de pedido, el nombre y segmento del cliente (por ejemplo: consumidor final, empresa o gobierno), así como la ubicación geográfica del cliente (país, ciudad, región). También se especifica la cantidad de productos solicitados, el método de envío utilizado (por ejemplo: envío estándar, prioritario o exprés), y el número de días que tardó en entregarse el pedido.

Uno de los aspectos más interesantes de esta base de datos es que también se incluye información sobre si el pedido arribó a tiempo o con retraso, lo cual permite realizar análisis de puntualidad y desempeño logístico. Esto abre la puerta a una gran variedad de estudios, como por ejemplo: detección de cuellos de botella en la cadena de suministro, evaluación de la eficiencia de los métodos de envío, identificación de patrones de comportamiento del cliente, análisis por región o segmento, y mucho más.


#### **El tipo de dato de cada variable es el siguiente:**
- Type _(texto)_
- Days for shipping (real) _(entero)_
- Days for shipment (scheduled) _(entero)_
- Benefit per order _(real)_
- Sales per customer _(real)_
- Delivery Status _(texto)_
- Late_delivery_risk _(booleano)_
- Category Id _(entero)_
- Category Name _(texto)_
- Customer City _(texto)_
- Customer Country _(texto)_
- Customer Fname _(texto)_
- Customer Id _(entero)_
- Customer Lname _(texto)_
- Customer Segment _(texto)_
- Customer State _(texto)_
- Customer Street _(texto)_
- Customer Zipcode _(entero)_
- Department Id _(entero)_
- Department Name _(texto)_
- Latitude _(real)_
- Longitude _(real)_
- Market _(texto)_
- Order City _(texto)_
- Order Country _(texto)_
- Order Customer Id _(entero)_
- order date (DateOrders) _(fecha)_
- Order Id _(entero)_
- Order Item Cardprod Id _(entero)_
- Order Item Discount _(real)_
- Order Item Discount Rate _(real)_
- Order Item Id _(entero)_
- Order Item Product Price _(real)_
- Order Item Profit Ratio _(real)_
- Order Item Quantity  _(real)_
- Sales  _(real)_
- Order Item Total  _(real)_
- Order Profit Per Order  _(real)_
- Order Region  _(texto)_
- Order State _(texto)_
- Order Status _(texto)_
- Product Card Id _(entero)_
- Product Category Id _(entero)_
- Product Description _(texto)_
- Product Image _(texto)_
- Product Name _(texto)_
- Product Price _(real)_
- Shipping date (DateOrders) _(fecha)_
- Shipping Mode _(texto)_

Si desea descargar la base de datos de click [aquí](https://data.mendeley.com/datasets/8gx2fvg2k6/3/files/29dc7b05-dda6-4834-8354-5b5cc44430df)

Después de investigar lo que es un **Sistema de Gestión de Bases de Datos** y ver los más utilizados actualmente, decidí elegir ***PostgreSQL***. 

"Es una base de datos de código abierto que tiene una sólida reputación por su fiabilidad, flexibilidad y soporte de estándares técnicos abiertos. A diferencia de otros RDMBS (sistemas de gestión de bases de datos relacionales), PostgreSQL (enlace externo a ibm.com) soporta tipos de datos relacionales y no relacionales." (IBM, s.f.).

Las principales ventajas de utilizar este SGBD según PostgreSQL Global Development Group e IBM son las siguientes:

1. Es un sistema de gestión de bases de datos que puede usarse, modificarse y distribuirse sin costos de licencia.
2. Admite tanto datos estructurados (tablas relacionales) como datos semiestructurados como JSON y XML.
3. Gracias a su sistema de concurrencia multiversión (MVCC), permite múltiples operaciones simultáneas sin bloqueos, optimizando el rendimiento multiusuario.
4. Cuenta con una amplia comunidad de usuarios, esto facilita el aprendizaje autodidacta.

#### Referencias:
1. PostgreSQL Global Development Group. (2024). PostgreSQL 16 Documentation. Recuperado de https://www.postgresql.org/docs/
2. ¿Qué es PostgreSQL?. IBM. Recuperado el 29 de mayo de 2025, de https://www.ibm.com/mx-es/topics/postgresql 