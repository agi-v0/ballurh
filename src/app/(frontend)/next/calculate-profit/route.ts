import { NextRequest, NextResponse } from 'next/server'

export async function POST(req: NextRequest): Promise<Response> {
  try {
    const data = await req.json()
    console.log('Received data:', data)
    // In a real application, you would process the data here.
    return NextResponse.json({ success: true, message: 'Data received successfully' })
  } catch (error) {
    console.error('Error processing request:', error)
    return NextResponse.json(
      { success: false, message: 'Error processing request' },
      { status: 500 },
    )
  }
}
