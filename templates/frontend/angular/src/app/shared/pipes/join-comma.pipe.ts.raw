import { Pipe, PipeTransform } from '@angular/core';

@Pipe({ name: 'joinComma'})
export class JoinCommaPipe implements PipeTransform {
  transform(value: any[], property: string): string {
    return value.map((item) => item[property] ).join(', ');
  }
}
