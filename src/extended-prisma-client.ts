import { PrismaClient } from './prisma';
import { PrismaBetterSqlite3 } from '@prisma/adapter-better-sqlite3';

export function getExtendedPrismaClient(siteUrl: string) {

    const adapter = new PrismaBetterSqlite3({ url: process.env.DB_CONNECTION_STRING })

    const extendedPrismaClient = new PrismaClient({ adapter }).$extends({
        result: {
            client: {
                client_id: {
                    needs: { id: true },
                    compute(data: { id: number | bigint; }) {
                        return data.id.toString();
                    }
                },
                redirect_uris: {
                    needs: { redirect: true },
                    compute(data: { redirect: string; }) {
                        const splitted: string[] = data.redirect.split(',').map((uri: string) => uri.trim());
                        return splitted;
                    }
                }
            }
        },
    }).$extends({
        result: {
            client: {
                token_endpoint_auth_method: {
                    needs: { redirect_uris: true },
                    compute: (data: { redirect_uris: string[] }) => {
                        if(data.redirect_uris.indexOf(`${siteUrl}/yggc/client/public`) !== -1) {
                            return 'none';
                        }
                    }
                }
            }
        }
    });

    return extendedPrismaClient;
}

export type ExtendedPrismaClient = ReturnType<typeof getExtendedPrismaClient>;
export const EXTENDED_PRISMA_SERVICE = 'EXTENDED_PRISMA_SERVICE';