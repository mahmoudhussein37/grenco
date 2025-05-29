// Debug script to test Contentful connection
import { createClient } from "contentful";

console.log('🔍 Debugging Contentful Connection...');
console.log('Environment Variables:');
console.log('VITE_CONTENTFUL_SPACE_ID:', import.meta.env.VITE_CONTENTFUL_SPACE_ID);
console.log('VITE_CONTENTFUL_ACCESS_TOKEN:', import.meta.env.VITE_CONTENTFUL_ACCESS_TOKEN ? 'Present' : 'Missing');

const spaceId = import.meta.env.VITE_CONTENTFUL_SPACE_ID || "g8e8ffg6jo04";
const accessToken = import.meta.env.VITE_CONTENTFUL_ACCESS_TOKEN || "YBepEoTgpTm0KSlSF9QCN1ub0_G-qTB04NlJktUJuVE";

console.log('Using Space ID:', spaceId);
console.log('Using Access Token:', accessToken.substring(0, 8) + '...');

const client = createClient({
  space: spaceId,
  accessToken: accessToken,
});

// Test the connection
try {
  console.log('🔄 Testing Contentful connection...');
  const response = await client.getEntries({
    content_type: 'news',
    limit: 1
  });
  
  console.log('✅ Connection successful!');
  console.log('Total items:', response.total);
  console.log('Items returned:', response.items.length);
  
  if (response.items.length > 0) {
    console.log('Sample item:', {
      id: response.items[0].sys.id,
      title: response.items[0].fields.title,
      category: response.items[0].fields.category
    });
  }
} catch (error) {
  console.error('❌ Connection failed:', error);
  console.error('Error details:', {
    message: error.message,
    status: error.status,
    statusText: error.statusText
  });
}
