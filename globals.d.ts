import 'little-state-machine'

declare module 'little-state-machine' {
  interface GlobalState {
    contactInfo: {
      name: string
      email: string
      phone: string
      businessName: string
    }
  }
}
