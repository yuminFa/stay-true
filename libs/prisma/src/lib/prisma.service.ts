import { Injectable, Logger, OnModuleDestroy, OnModuleInit } from '@nestjs/common'
import { ConfigService } from '@nestjs/config'
import { Prisma, PrismaClient } from '@prisma/client'

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit, OnModuleDestroy {
	constructor(configService: ConfigService) {
		super({
			datasources: {
				db: {
					url: configService.get('DATABASE_URL'),
				},
			},
			log: [
				{
					emit: 'event',
					level: 'query',
				},
			],
		})

		this.$on('query' as never, async (e: Prisma.QueryEvent) => {
			Logger.log('Query: ' + e.query)
			Logger.log('Params: ' + e.params)
			Logger.log('Duration: ' + e.duration + 'ms')
		})
	}

	async onModuleInit() {
		await this.$connect()
	}

	async onModuleDestroy() {
		await this.$disconnect()
	}
}

// function createPrismaQueryEventHandler() {
// 	throw new Error('Function not implemented.')
// }
