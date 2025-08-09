import { Controller, Get, Logger, Render } from '@nestjs/common';
import { PrismaService } from '@stay-simple/prisma';

@Controller()
export class AppController {
    constructor(private readonly prismaService: PrismaService) { }

    @Get()
    @Render('index')
    async getData() {
        const account = await this.prismaService.account.findFirst()
        Logger.log(account)

        return { message: 'Hello world!' };
    }

    getApiData() {
        return { message: 'Hello API!' };
    }

}
