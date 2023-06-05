import {
  ChangeDetectionStrategy,
  ChangeDetectorRef,
  Component,
  HostListener,
  OnDestroy,
  OnInit,
  ViewEncapsulation,
} from '@angular/core';
import { Subject, takeUntil } from 'rxjs';

import { GlobalFacade, NavigationFacade } from '@store';
import { Router } from '@angular/router';

@Component({
  selector: 'app-main',
  templateUrl: './admin.layout.html',
  encapsulation: ViewEncapsulation.None,
  changeDetection: ChangeDetectionStrategy.OnPush,
  providers: [NavigationFacade],
})
export class AdminLayout implements OnInit, OnDestroy {
  private destroyed$ = new Subject<void>();
  isCollapsed!: boolean;
  isDesktop!: boolean;

  year!: number;
  listMenu: any = [];

  constructor(
    private cdr: ChangeDetectorRef,
    public globalFacade: GlobalFacade,
    public navigationFacade: NavigationFacade,
    protected router: Router,
  ) {}

  ngOnInit(): void {
    this.globalFacade.isDesktop$.pipe(takeUntil(this.destroyed$)).subscribe((v) => (this.isDesktop = v));
    this.globalFacade.isCollapsed$.pipe(takeUntil(this.destroyed$)).subscribe((v) => (this.isCollapsed = v));
    this.navigationFacade.navigationWebappList$.pipe(takeUntil(this.destroyed$)).subscribe((menu) => {
      this.listMenu = JSON.parse(JSON.stringify(menu));
      this.cdr.detectChanges();
    });
    this.globalFacade.breadcrumbs$.pipe(takeUntil(this.destroyed$)).subscribe(() => this.cdr.detectChanges());

    this.navigationFacade.getUserWebapp();
    this.year = new Date().getFullYear();
  }

  ngOnDestroy(): void {
    this.destroyed$.next();
    this.destroyed$.complete();
  }

  @HostListener('window:resize', ['$event'])
  onResize(event: any): void {
    if (event.currentTarget.innerWidth < 1025 && !this.isCollapsed) {
      this.globalFacade.collapsed(true);
    }
    if (event.currentTarget.innerWidth > 767 && !this.isDesktop) {
      this.globalFacade.collapsed(true);
    } else if (event.currentTarget.innerWidth <= 767 && this.isDesktop) {
      this.globalFacade.collapsed(false);
    }
  }

  goRoute(e: any, url: string[], queryParams: any) {
    e.stopPropagation();
    this.router.navigate(url, { queryParams });
  }
}
