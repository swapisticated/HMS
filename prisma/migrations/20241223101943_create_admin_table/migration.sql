/*
  Warnings:

  - Added the required column `password` to the `Employee` table without a default value. This is not possible if the table is not empty.

*/
-- CreateTable
CREATE TABLE "Admin" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Employee" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "employeeId" TEXT NOT NULL,
    "firstName" TEXT NOT NULL,
    "lastName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "phone" TEXT,
    "gender" TEXT,
    "department" TEXT,
    "dateOfJoining" DATETIME,
    "dateOfBirth" DATETIME,
    "fatherName" TEXT,
    "pan" TEXT,
    "personalEmail" TEXT,
    "residentialAddress" TEXT,
    "paymentMode" TEXT,
    "accountNumber" TEXT,
    "accountHolderName" TEXT,
    "bankName" TEXT,
    "ifsc" TEXT,
    "accountType" TEXT,
    "baseSalary" REAL NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);
INSERT INTO "new_Employee" ("accountHolderName", "accountNumber", "accountType", "bankName", "baseSalary", "createdAt", "dateOfBirth", "dateOfJoining", "department", "email", "employeeId", "fatherName", "firstName", "gender", "id", "ifsc", "lastName", "pan", "paymentMode", "personalEmail", "phone", "position", "residentialAddress", "updatedAt") SELECT "accountHolderName", "accountNumber", "accountType", "bankName", "baseSalary", "createdAt", "dateOfBirth", "dateOfJoining", "department", "email", "employeeId", "fatherName", "firstName", "gender", "id", "ifsc", "lastName", "pan", "paymentMode", "personalEmail", "phone", "position", "residentialAddress", "updatedAt" FROM "Employee";
DROP TABLE "Employee";
ALTER TABLE "new_Employee" RENAME TO "Employee";
CREATE UNIQUE INDEX "Employee_employeeId_key" ON "Employee"("employeeId");
CREATE UNIQUE INDEX "Employee_email_key" ON "Employee"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Admin_username_key" ON "Admin"("username");