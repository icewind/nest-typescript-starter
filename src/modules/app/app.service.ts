import { Injectable } from '@nestjs/common';

@Injectable()
export default class AppService {
  greetings(): string {
    return 'Hello World!';
  }
}
