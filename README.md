# Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench
My analysis process for the Coursera project "Analyze Data in a Model Car Database with MySQL Workbench". 

In this project, I will assist in the analysis of data in a relational database as an entry-level data analyst at the Mint Classics Company in order to support business choices regarding inventory that result in the closure of a storage facility.

Working on this project allowed me to show off my proficiency with SQL and its application to efficient inventory management. My aim was to demonstrate how to evaluate warehouse data, comprehend the distribution of product inventories, and offer useful recommendations for enhancing inventory control. 

Through this project, I wanted to demonstrate my ability for data-driven decision-making, which will increase the strategic and operational effectiveness of inventory management.

#Project Objectives

##1. Explore products currently in inventory.

##2. Determine important factors that may influence inventory reorganization/reduction.

##3. Provide analytic insights and data-driven recommendations.

**Task 1 - Import Classic Car Model Database**

   Download the mintclassicsDB.sql file that contains the script to create and populate the Mint Classics relational database.  
   Using the "Import from Self-Contained File" option from the Data Import tool, use the script to create the Mint Classic database on your MySQL Workbench platform. 
   The script includes commands to create the schema (called "mintclassics"), along with the tables and fields, primary and foreign keys, and the data. 
   When the script has run successfully you will have a working relational nine-table database populated with data from the Mint Classics company.![image](https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/blob/main/Picture1.png)

**Task 2 - Understanding the Mint Classics Database and Its Business Processes**

- Identify the total number of warehouses and their capacity.
  
  <img width="288" alt="Screenshot 2024-03-10 at 5 56 56 PM" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/8a3f07be-6bd9-4b54-a720-69b968a714fd">
  
  => There are four warehouses, each with its unique code, name, and current capacity in percent. Among them, Warehouse C stands out with ample space, currently filled at only 50%.

- Identify the total of products offered by this company.

   => The company currently holds a diverse inventory of 110 distinct products.

- Determine if any products are stored in multiple warehouses.

   => No products are stored across multiple warehouses. Thus, it's evident that each warehouse exclusively stores specific product lines.

- Identify the unique product count and total stock in each warehouse.

  <img width="386" alt="Screenshot 2024-03-10 at 6 03 49 PM" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/da317085-f42e-4ccf-8706-4aaeb0ef60bd">

   => Warehouse B boasts an impressive inventory, housing a total of 38 different products with a combined stock of 219.183 units, making it the warehouse with the highest storage capacity.

- Identify which product lines are stored in each warehouse.

  <img width="479" alt="Screenshot 2024-03-10 at 6 06 42 PM" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/a8b4dd7d-c174-490c-bdc9-50f6f99ee6ed">

        Warehouse A (North): Planes + Motorcycles
  
         12 planes, 13 motorcycles = 25 total products
  
        Warehouse B (East): Classic Cars

         38 total products for classic cars

        Warehouse C (West): Vintage Cars

         24 total products for vintage cars

        Warehouse D (South): Trucks + Buses, Ships, Trains

         11 trucks + buses, 9 ships, 3 trains = 23 total

- Determine the product lines with the highest and lowest number of sales.
  
<img width="204" alt="23" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/9e7a5aa9-4153-4265-98d8-a638eb352c03">

  

**Task 3 - Investigating Business Issues and Identifying Affected Tables**


   I am going to look into Mint Classics' business problem, which is that company wants to close one of its warehouses. I will determine which tables are relevant to the problem and use SQL queries to obtain the required information.
   Let's create a temporary table to evaluate the difference between our product stock and the inventory that remains after fulfillment (shipped and resolved orders). This table will be a useful resource for identifying overstock, appropriately stocked commodities, and understock conditions.
   
   <img width="468" alt="image" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/818f2029-45dc-43d4-9b40-980dd44d9476">
   
   Then, determine the quantity of products that are wellstocked, overstocked and understocked in each warehouse.
   
   
   <img width="299" alt="image" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/324eb642-670e-4641-87fe-18c1f1117f65">
   

   <img width="299" alt="image" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/292ea044-697b-4f65-8f9c-8134f6a27eed">
   

   => It appears that Warehouse B has the highest quantity of overstocked products, totaling 29 items, while both Warehouse A and Warehouse C have the same number of overstocked products, amounting to 19 each.

   Subsequently, we can analyze various product lines, identifying those with the highest sales percentages, and gain insights into each product line's inventory and sales performance.

<img width="468" alt="image" src="https://github.com/thienhuongdn2002/Analyze-Data-in-a-Model-Car-Database-with-MySQL-Workbench/assets/144947062/e3334e33-c601-46d5-b65f-42699a57995a">

**Task 4 - Report**

   After analyzing all the information, I am ready to prepare a comprehensive report that formulates recommendations to address business issues and crafts conclusions and recommendations supported by SQL data.




