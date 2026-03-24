import { expo } from "@better-auth/expo";
import { betterAuth, url } from "better-auth";
import { Pool } from "pg";

const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

export const auth = betterAuth({
  database: pool,
  plugins: [
    expo()
  ],
  trustedOrigins: ["schedula://",

    "exp://",
    "exp://**/**",
    "exp://192.168.*.*:*/**",
  ],
  secret: process.env.BETTER_AUTH_SECRET,
  url: process.env.BETTER_AUTH_URL,
  socialProviders: {
    google: {
      clientId: process.env.GOOGLE_CLIENT_ID!,
      clientSecret: process.env.GOOGLE_CLIENT_SECRET,
    },
    // apple:{
    //   clientId: process.env.APPLE_CLIENT_ID!,
    //   clientSecret: process.env.APPLE_CLIENT_SECRET,
    // }
  }
});