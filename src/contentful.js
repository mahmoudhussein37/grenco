import { createClient } from "contentful";

const client = createClient({
  space: import.meta.env.VITE_CONTENTFUL_SPACE_ID || "g8e8ffg6jo04",
  accessToken:
    import.meta.env.VITE_CONTENTFUL_ACCESS_TOKEN ||
    "YOUR_CONTENTFUL_ACCESS_TOKEN_HERE",
});

export default client;
