-- CreateTable
CREATE TABLE "OrderHistory" (
    "id" SERIAL NOT NULL,
    "clientID" INTEGER NOT NULL,
    "orderedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "OrderHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Order" (
    "id" SERIAL NOT NULL,
    "orderHistoryID" INTEGER NOT NULL,
    "cuisineID" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,

    CONSTRAINT "Order_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Client" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "tel" INTEGER NOT NULL,

    CONSTRAINT "Client_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cuisine" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    "categoryID" INTEGER NOT NULL,

    CONSTRAINT "Cuisine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewCuisine" (
    "id" SERIAL NOT NULL,
    "cuisineID" INTEGER NOT NULL,

    CONSTRAINT "NewCuisine_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "OrderHistory_clientID_key" ON "OrderHistory"("clientID");

-- CreateIndex
CREATE UNIQUE INDEX "Order_orderHistoryID_key" ON "Order"("orderHistoryID");

-- CreateIndex
CREATE UNIQUE INDEX "Order_cuisineID_key" ON "Order"("cuisineID");

-- CreateIndex
CREATE UNIQUE INDEX "Cuisine_categoryID_key" ON "Cuisine"("categoryID");

-- CreateIndex
CREATE UNIQUE INDEX "NewCuisine_cuisineID_key" ON "NewCuisine"("cuisineID");

-- AddForeignKey
ALTER TABLE "OrderHistory" ADD CONSTRAINT "OrderHistory_clientID_fkey" FOREIGN KEY ("clientID") REFERENCES "Client"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_orderHistoryID_fkey" FOREIGN KEY ("orderHistoryID") REFERENCES "OrderHistory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order" ADD CONSTRAINT "Order_cuisineID_fkey" FOREIGN KEY ("cuisineID") REFERENCES "Cuisine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cuisine" ADD CONSTRAINT "Cuisine_categoryID_fkey" FOREIGN KEY ("categoryID") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewCuisine" ADD CONSTRAINT "NewCuisine_cuisineID_fkey" FOREIGN KEY ("cuisineID") REFERENCES "Cuisine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
