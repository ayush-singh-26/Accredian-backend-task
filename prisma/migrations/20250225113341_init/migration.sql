/*
  Warnings:

  - The primary key for the `Referral` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `course` on the `Referral` table. All the data in the column will be lost.
  - Added the required column `courseName` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "Referral_refereeEmail_key";

-- DropIndex
DROP INDEX "Referral_referrerEmail_key";

-- AlterTable
ALTER TABLE "Referral" DROP CONSTRAINT "Referral_pkey",
DROP COLUMN "course",
ADD COLUMN     "courseName" TEXT NOT NULL,
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "message" DROP NOT NULL,
ADD CONSTRAINT "Referral_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Referral_id_seq";
