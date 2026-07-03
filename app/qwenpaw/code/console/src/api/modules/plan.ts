import { get, post, put, del } from "../root";

const BASE_URL = "/api";

async function request<T>(path: string, init?: RequestInit): Promise<T> {
  const resp = await fetch(`${BASE_URL}${path}`, {
    headers: { "Content-Type": "application/json" },
    ...init,
  });
  if (!resp.ok) {
    throw new Error(`HTTP ${resp.status}`);
  }
  return resp.json() as Promise<T>;
}

export const get = <T>(path: string) => request<T>(path);

export const planApi = {
  getPlanConfig: async (): Promise<{ enabled: boolean }> => {
    try {
      return await get<{ enabled: boolean }>("/api/agents/plan-config");
    } catch {
      return { enabled: false };
    }
  },
  getCurrentPlan: async (): Promise<unknown> => {
    return null;
  },
};

export interface PlanStateResponse {
  enabled: boolean;
  currentPlan: unknown;
}

export const subscribePlanUpdates = (
  _callback: (plan: unknown, sessionId: string) => void,
) => {
  // noop stub
  return () => {};
};
