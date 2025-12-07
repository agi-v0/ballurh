import { createStore } from 'little-state-machine'

export interface ContactInfo {
  name: string
  email: string
  phone: string
  businessName: string
}

export interface ContactStore {
  contactInfo: ContactInfo
}

const initialState: ContactStore = {
  contactInfo: {
    name: '',
    email: '',
    phone: '+966',
    businessName: '',
  },
}

export const contactStore =
  typeof window !== 'undefined'
    ? createStore(initialState, { storageType: window.localStorage })
    : createStore(initialState)

export function updateContactInfo(state: ContactStore, payload: ContactInfo) {
  return {
    ...state,
    contactInfo: {
      ...state.contactInfo,
      ...payload,
    },
  }
}

export function resetContactInfo(state: ContactStore) {
  return {
    ...state,
    contactInfo: initialState.contactInfo,
  }
}
