/*
  Warnings:

  - Added the required column `message` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Referral" ADD COLUMN     "message" TEXT NOT NULL;
