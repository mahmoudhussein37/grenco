import { defineStore } from 'pinia'
import { ref } from 'vue'
import contentful from '../contentful'
import { documentToHtmlString } from '@contentful/rich-text-html-renderer'

export interface NewsEntry {
  id: string
  title: string
  excerpt: string
  content: string
  date: string
  image: {
    url: string
    title: string
  }
  category: string
}

export const useNewsStore = defineStore('news', () => {
  const news = ref<NewsEntry[]>([])
  const loading = ref(false)
  const error = ref<string | null>(null)
  const fetchNews = async (currentLocale = 'en-US') => {
    loading.value = true
    error.value = null
  
    try {
      console.log('🔄 Fetching news from Contentful...')
      console.log('Locale:', currentLocale)
      
      const response = await contentful.getEntries({
        content_type: 'news',
        order: ['-fields.date'] as any,
        locale: currentLocale
      })
      
      console.log('✅ Contentful response:', {
        total: response.total,
        items: response.items.length
      })
      
      news.value = response.items.map((item: any) => ({
        id: item.sys.id,
        title: item.fields.title,
        excerpt: item.fields.excerpt,
        content: documentToHtmlString(item.fields.content),
        date: item.fields.date,
        image: {
          url: item.fields.image?.fields?.file?.url 
            ? `https:${item.fields.image.fields.file.url}`
            : 'https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg',
          title: item.fields.image?.fields?.title || 'News Image'
        },
        category: item.fields.category
      }))
      
      console.log('✅ News processed:', news.value.length, 'articles')
    } catch (err: any) {
      console.error('❌ Error fetching news:', err)
      console.error('Error details:', {
        message: err.message,
        status: err.status,
        statusText: err.statusText,
        details: err.details
      })
      
      error.value = `Failed to fetch news: ${err.message || 'Unknown error'}. Please check console for details.`
    } finally {
      loading.value = false
    }
  }
  

  return { news, loading, error, fetchNews }
})