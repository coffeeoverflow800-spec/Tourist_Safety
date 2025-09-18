const twilio = require("twilio");
const nodemailer = require("nodemailer");

// Assumes environment variables are set for Twilio and email credentials.
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const twilioClient = twilio(accountSid, authToken);

const mailTransporter = nodemailer.createTransport({
  service: "gmail", // Or any other email service
  auth: {
    user: process.env.EMAIL_USER,
    pass: process.env.EMAIL_PASS,
  },
});

/**
 * Sends an SMS message using Twilio.
 * @param {string} to - The recipient's phone number.
 * @param {string} body - The message content.
 */
exports.sendSMS = async (to, body) => {
  try {
    const message = await twilioClient.messages.create({
      body: body,
      from: process.env.TWILIO_PHONE_NUMBER,
      to: to,
    });
    console.log(`SMS sent: ${message.sid}`);
  } catch (error) {
    console.error("Error sending SMS:", error);
  }
};

/**
 * Sends an email using Nodemailer.
 * @param {string} to - The recipient's email address.
 * @param {string} subject - The email subject.
 * @param {string} html - The HTML content of the email.
 */
exports.sendEmail = async (to, subject, html) => {
  try {
    const mailOptions = {
      from: process.env.EMAIL_USER,
      to: to,
      subject: subject,
      html: html,
    };
    await mailTransporter.sendMail(mailOptions);
    console.log("Email sent successfully");
  } catch (error) {
    console.error("Error sending email:", error);
  }
};
