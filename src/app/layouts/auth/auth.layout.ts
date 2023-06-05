import { ChangeDetectionStrategy, Component, ViewEncapsulation } from '@angular/core';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.layout.html',
  encapsulation: ViewEncapsulation.None,
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class AuthLayout {
  constructor(public translate: TranslateService) {}

  changeLanguage(value: string): void {
    localStorage.setItem('ng-language', value);
    this.translate.setDefaultLang(value);
  }
}
