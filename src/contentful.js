import { createClient } from "contentful";

// Enhanced Contentful client with debugging
const spaceId = import.meta.env.VITE_CONTENTFUL_SPACE_ID || "g8e8ffg6jo04";
const accessToken = import.meta.env.VITE_CONTENTFUL_ACCESS_TOKEN || "YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE";

// Debug logging (only in development)
if (import.meta.env.DEV) {
  console.log("🔧 Contentful Configuration:");
  console.log("Space ID:", spaceId);
  console.log("Access Token:", accessToken ? `${accessToken.substring(0, 8)}...` : "Not provided");
  console.log("Environment:", import.meta.env.MODE);
}

const client = createClient({
  space: spaceId,
  accessToken: accessToken,
  environment: 'master' // Explicitly set environment
});

export default client;
