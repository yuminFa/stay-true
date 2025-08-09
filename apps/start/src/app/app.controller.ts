import { Controller, Get, Render } from '@nestjs/common';

@Controller()
export class AppController {
    @Get()
    @Render('index')
    getData() {
        return { message: 'Hello world!' };
    }

    getApiData() {
        return { message: 'Hello API!' };
    }
}
