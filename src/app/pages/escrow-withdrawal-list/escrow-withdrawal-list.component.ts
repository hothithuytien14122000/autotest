import {
  ChangeDetectionStrategy,
  Component,
  OnDestroy,
  OnInit,
  TemplateRef,
  ViewChild,
  ViewEncapsulation,
} from '@angular/core';

import { EscrowWithdrawalList, EscrowWithdrawalListFacade, GlobalFacade, RoleFacade, UserFacade } from '@store';
import { FormatCurrencyPipe, FormatDatePipe } from '@pipes';
import { ListStatusEscrowWithdrawal } from './status.model';
import { DataTableModel } from '@model';
import { ActivatedRoute, Router } from '@angular/router';
import { Subject, take, takeUntil } from 'rxjs';
import { DataTableComponent } from '@core/data-table/data-table.component';

@Component({
  selector: 'app-escrow-withdrawal-list',
  templateUrl: './escrow-withdrawal-list.component.html',
  providers: [GlobalFacade, FormatDatePipe, FormatCurrencyPipe, EscrowWithdrawalListFacade, UserFacade, RoleFacade],
  encapsulation: ViewEncapsulation.None,
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class EscrowWithdrawalListComponent implements OnInit, OnDestroy {
  protected readonly listStatus = ListStatusEscrowWithdrawal;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private formatDate: FormatDatePipe,
    private formatCurrency: FormatCurrencyPipe,
    private globalFacade: GlobalFacade,
    protected roleFacade: RoleFacade,
    protected userFacade: UserFacade,
    protected escrowWithdrawalListFacade: EscrowWithdrawalListFacade,
  ) {}

  @ViewChild('tableEscrowWithdrawalList') tableEscrowWithdrawalList!: DataTableComponent;
  private destroyed$ = new Subject<void>();

  ngOnInit(): void {
    this.globalFacade.setBreadcrumbs([
      {
        title: 'routes.admin.escrow.ESCROW_MANAGEMENT',
        link: '/escrow-list',
      },
      {
        title: 'routes.admin.escrow.escrow_withdrawal_list',
        link: '/escrow-list',
      },
    ]);
    this.userFacade.getList({ page: 1, size: -1 });
    this.roleFacade.rolesCustomer({ page: 1, size: 10 });
    this.escrowWithdrawalListFacade.id$.pipe(take(1)).subscribe((id) => {
      if (!!id) {
        this.id = id;
        this.escrowWithdrawalListFacade.setId(null);
      }
    });
    this.escrowWithdrawalListFacade.status$.pipe(takeUntil(this.destroyed$)).subscribe((status) => {
      switch (status) {
        case 'rejectOk':
        case 'approveOk':
          this.isVisibleReject = false;
          this.tableEscrowWithdrawalList.changeData();
          break;
      }
    });
    setTimeout(() => {
      this.table();
    });
  }

  ngOnDestroy(): void {
    this.destroyed$.next();
    this.destroyed$.complete();
  }

  id?: string = '';

  classRow(data: EscrowWithdrawalList, { id }: { id: string }) {
    return data.id === id ? 'bg-blue-100' : '';
  }

  @ViewChild('statusCode') statusCode!: TemplateRef<HTMLTemplateElement>;
  columnsTable: DataTableModel<EscrowWithdrawalList>[] = [];
  isVisibleReject = false;
  idReject = '';

  private table() {
    this.columnsTable = [
      {
        name: 'code',
        title: 'routes.admin.escrow.code_escrow_withdrawal',
        tableItem: {
          width: '120px',
          align: 'center',
          render: (data) => `<span class="text-blue-800 hover:text-blue-600">${data.code}</span>`,
          onClick: (data) => this.router.navigate([data.id, data.profileTypeCode], { relativeTo: this.route }),
        },
      },
      {
        name: 'createdByName',
        title: 'routes.admin.escrow.full_name',
        tableItem: {},
      },
      {
        name: 'createdOnDate',
        title: 'routes.admin.escrow.date_withdrawal',
        tableItem: {
          width: '150px',
          align: 'center',
          render: (data) => this.formatDate.transform(data.createdOnDate, 'DD/MM/YYYY - HH:mm'),
        },
      },
      {
        name: 'depositAmount',
        title: 'routes.admin.escrow.money_amount',
        tableItem: {
          width: '150px',
          align: 'center',
          render: (data) => this.formatCurrency.transform(data.withdrawalAmount, '₫'),
        },
      },
      {
        name: 'profileTypeCode',
        title: 'routes.admin.escrow.type_account',
        tableItem: {
          width: '150px',
          align: 'center',
          render: (data) =>
            data.profileTypeCode == 'FARMER_SIDE'
              ? 'Farmer Side'
              : data.profileTypeCode == 'ORDER_SIDE'
              ? 'Order Side'
              : '',
        },
      },
      {
        name: 'statusCode',
        title: 'routes.admin.escrow.status',
        tableItem: {
          width: '100px',
          align: 'center',
          renderTemplate: this.statusCode,
        },
      },
      {
        name: '',
        title: 'routes.admin.escrow.action',
        tableItem: {
          width: '85px',
          align: 'center',
          actions: [
            {
              icon: () => 'la-check',
              text: () => 'routes.admin.escrow.approve',
              color: () => '#40A9FF',
              confirm: true,
              condition: (data) => data.statusCode == 'WFA',
              onClick: (data) => this.escrowWithdrawalListFacade.approve(data.id),
            },
            {
              icon: () => 'la-times',
              text: () => 'routes.admin.escrow.reject',
              color: () => '#ec3737',
              condition: (data) => data.statusCode == 'WFA',
              onClick: (data) => {
                this.idReject = data.id;
                this.isVisibleReject = true;
              },
            },
            {
              icon: () => 'la-eye',
              text: () => 'routes.admin.escrow.detail_escrow',
              color: () => '#40A9FF',
              condition: (data) => data.statusCode != 'WFA',
              onClick: (data) => this.router.navigate([data.id, data.profileTypeCode], { relativeTo: this.route }),
            },
          ],
        },
      },
    ];
  }
}
