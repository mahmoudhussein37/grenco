import { defineStore } from 'pinia'
import { ref } from 'vue'

export interface Product {
  id: number
  name: string
  description: string
  fullDescription?: string
  specs?: {
    [key: string]: string | number
  }
  plasticTypes: string[]
  features: string[]
  image: string
  gallery?: string[]
}

export const useProductsStore = defineStore('products', () => {
  const products = ref<Product[]>([
    {
      id: 1,
      name: 'EcoGrind S100',
      description: 'Compact plastic grinding machine optimized for small workshops',
      fullDescription: 'The EcoGrind S100 is our entry-level smart recycling machine, perfect for small workshops and businesses just starting their recycling journey. This compact unit offers excellent performance while requiring minimal space and investment.',
      specs: {
        capacity: '50 kg/hour',
        power: '3.5 kW',
        dimensions: '1.2m x 0.8m x 1.5m',
        weight: '180 kg',
        noise: '65 dB'
      },
      plasticTypes: ['PET', 'HDPE', 'LDPE'],
      features: [
        'Smart energy management',
        'Remote monitoring via mobile app',
        'Customizable grinding settings',
        'Automatic shutdown when idle',
        'Small footprint design'
      ],
      image: 'assets/images/products/machine1.jpeg',
      gallery: [
        'assets/images/products/machine1.jpeg',
        'https://images.pexels.com/photos/802221/pexels-photo-802221.jpeg',
        'assets/images/products/machine2.jpeg'
      ]
    },
    {
      id: 2,
      name: 'RecycleMaster R200',
      description: 'Medium capacity recycling solution for diverse plastic types',
      fullDescription: 'The RecycleMaster R200 is our mid-range recycling machine, designed for medium-sized operations that need versatility and higher capacity. With advanced features and solid construction, it delivers reliable performance across a wide range of plastic materials.',
      specs: {
        capacity: '120 kg/hour',
        power: '7.5 kW',
        dimensions: '2.1m x 1.2m x 1.8m',
        weight: '350 kg',
        noise: '70 dB'
      },
      plasticTypes: ['PET', 'HDPE', 'LDPE', 'PP', 'PS'],
      features: [
        'Advanced sorting system',
        'Real-time analytics dashboard',
        'Energy-efficient operation',
        'Automatic material detection',
        'One-touch operation',
        'Predictive maintenance alerts'
      ],
      image: 'assets/images/products/machine2.jpeg',
      gallery: [
        'assets/images/products/machine2.jpeg',
        'assets/images/products/machine1.jpeg',
        'assets/images/products/machine3.jpeg'
      ]
    },
    {
      id: 3,
      name: 'InduStrong I500',
      description: 'Heavy-duty industrial recycling system for high-volume operations',
      fullDescription: 'The InduStrong I500 is our flagship industrial recycling system, engineered for factories and large recycling operations. This heavy-duty machine offers maximum throughput, exceptional reliability, and comprehensive automation features to minimize labor costs and maximize productivity.',
      specs: {
        capacity: '500 kg/hour',
        power: '22 kW',
        dimensions: '3.5m x 2.2m x 2.5m',
        weight: '1200 kg',
        noise: '75 dB'
      },
      plasticTypes: ['All major plastic types'],
      features: [
        'Maximum throughput design',
        'AI-powered sorting technology',
        'Full automation options',
        'Industrial-grade construction',
        'Advanced safety systems',
        'Cloud-based monitoring and control',
        'Integration with factory systems'
      ],
      image: 'assets/images/products/machine3.jpeg',
      gallery: [
        'assets/images/products/machine3.jpeg',
        'assets/images/products/machine2.jpeg',
        'assets/images/products/machine1.jpeg'
      ]
    }
  ])

  function getProductById(id: number): Product | undefined {
    return products.value.find(product => product.id === id)
  }

  return { products, getProductById }
})