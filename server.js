import express from "express";
import cors from "cors";
import dotenv from 'dotenv';
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

dotenv.config();

const app = express();

app.use(express.json());

app.use(cors());

app.get('/', (req, res) => {
    res.send('Welcome');
})

app.post('/referal', async (req, res) => {

    const {
        referrerName,
        referrerEmail,
        refereeName,
        refereeEmail,
        courseName,
        message
    } = req.body;

    const newReferral = await prisma.referral.create({
        data: {
            referrerName,
            referrerEmail,
            refereeName,
            refereeEmail,
            courseName,
            message
        }
    });

    res.status(200).json({
        message: 'Referral submitted successfully',
        referral: newReferral
    });
})

app.get('/getAllReferals',async(req,res)=>{
    const allReferals= await prisma.referral.findMany();
    res.json(allReferals);
})

app.listen(8000, () => {
    console.log('Server listening on http://localhost:8000');
})