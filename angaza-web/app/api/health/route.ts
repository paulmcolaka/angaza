import { NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";

export async function GET() {
  const start = Date.now();
  try {
    await prisma.$queryRaw`SELECT 1`;
    return NextResponse.json({ status:"ok", db:"connected",
      latencyMs: Date.now()-start, ts: new Date().toISOString() });
  } catch (e) {
    return NextResponse.json({ status:"error", db:"disconnected" }, { status:503 });
  }
}
