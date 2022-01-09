import nodemailer from "nodemailer";

export default function (emailReceived, content){
    const transporter = nodemailer.createTransport('smtps://group19ktpm%40gmail.com:13141152099@smtp.gmail.com');
    const mailOptions = {
        from: '"Online Auction System" <foo@gmail.com>', // sender address
        to: emailReceived, // list of receivers
        subject: 'Online Auction System ✔', // Subject line
        text: 'Mailing System', // plaintext body
        html: content
    };
    transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
            return console.log(error);
        }
        console.log('Message sent: ' + info.response);
    });
}