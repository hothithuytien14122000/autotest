import {
  ChangeDetectionStrategy,
  Component,
  OnDestroy,
  OnInit,
  TemplateRef,
  ViewChild,
  ViewEncapsulation,
} from '@angular/core';

import {
  DepositsWalletList,
  GlobalFacade,
  TransactionsWalletList,
  User,
  WalletDepositsFacade,
  WalletListFacade,
} from '@store';
import { ActivatedRoute, Router } from '@angular/router';
import { DataTableModel } from '@model';
import { FormatCurrencyPipe, FormatDatePipe } from '@pipes';
import { skip, Subject, takeUntil } from 'rxjs';

@Component({
  selector: 'app-detail-wallet-list',
  templateUrl: './detail.wallet-list.component.html',
  providers: [WalletListFacade, FormatDatePipe, FormatCurrencyPipe, GlobalFacade, WalletDepositsFacade],
  encapsulation: ViewEncapsulation.None,
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class DetailWalletListComponent implements OnInit, OnDestroy {
  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private formatDate: FormatDatePipe,
    public formatCurrency: FormatCurrencyPipe,
    private globalFacade: GlobalFacade,
    private walletDepositsFacade: WalletDepositsFacade,
    public walletListFacade: WalletListFacade,
  ) {}

  user?: User;
  private destroyed$ = new Subject<void>();

  ngOnInit(): void {
    this.globalFacade.setBreadcrumbs([
      {
        title: 'routes.admin.wallet.electronic_wallet_management',
        link: '/wallet-list',
      },
      {
        title: 'routes.admin.wallet.wallets_list',
        link: '/wallet-list',
      },
    ]);
    this.globalFacade.user$.pipe(takeUntil(this.destroyed$)).subscribe((user) => {
      this.user = user?.userModel;
    });
    this.walletListFacade.getById(this.route.snapshot.params.id);
    this.walletListFacade.data$.pipe(skip(1), takeUntil(this.destroyed$)).subscribe((data) => {
      if (data) {
        this.walletListFacade.getTransactionsOfWallet(data.id, { page: 1, size: 20 });
        this.walletListFacade.getDepositsOfWallet(data.id, { page: 1, size: 20 });
        this.tableTransaction();
        this.tableWallet();
      }
    });
  }

  ngOnDestroy(): void {
    this.destroyed$.next();
    this.destroyed$.complete();
  }

  handleChangeLock(locked: boolean): void {
    const { id } = this.route.snapshot.params;
    if (locked) this.walletListFacade.putUnlock(id);
    else this.walletListFacade.putLock(id);
  }

  isVisibleDeposits = false;
  idDeposits!: string;

  handleUnShowDeposits(): void {
    this.isVisibleDeposits = false;
  }

  handleShowDeposits(data: DepositsWalletList) {
    this.walletDepositsFacade.getById(data.id);
    this.isVisibleDeposits = true;
  }

  handleShowOrder(id: string) {
    this.router.navigate(['/order/detail', id]);
  }

  // handleShowPaymentRequest(id: string) {}

  columnsTransactions: DataTableModel<TransactionsWalletList>[] = [];
  @ViewChild('moneyAmount') moneyAmount!: TemplateRef<HTMLTemplateElement>;

  private tableTransaction() {
    setTimeout(() => {
      this.columnsTransactions = [
        {
          name: 'createdOnDate',
          title: 'routes.admin.wallet.creation_date',
          tableItem: {
            width: '150px',
            render: (data) => this.formatDate.transform(data.createdOnDate, 'HH:mm:ss DD/MM/YYYY'),
          },
        },
        {
          name: 'amount',
          title: 'routes.admin.wallet.money_amount',
          tableItem: {
            width: '150px',
            renderTemplate: this.moneyAmount,
          },
        },
        {
          name: 'note',
          title: 'routes.admin.wallet.transaction_content',
          tableItem: {},
        },
        {
          name: 'link',
          title: 'routes.admin.wallet.link',
          tableItem: {
            width: '150px',
            align: 'center',
            actions: [
              {
                text: () => 'routes.admin.wallet.order',
                bgColor: () => '#5260ff',
                condition: (data) => !!data.refOrderId,
                onClick: (data) => this.handleShowOrder(data.refOrderId),
              },
              {
                text: () => 'routes.admin.wallet.interest_payment',
                bgColor: () => '#3dc2ff',
                condition: (data) => !!data.refPaymentRequestId,
              },
              // {
              //   text: () => 'Trả lãi',
              //   bgColor: () => '#3dc2ff',
              //   condition: (data) => !!data.refPaymentRequestId,
              //   onClick: (data) => this.handleShowPaymentRequest(data.refPaymentRequestId),
              // },
            ],
          },
        },
      ];
    });
  }

  columnsDeposits: DataTableModel<DepositsWalletList>[] = [];

  private tableWallet() {
    setTimeout(() => {
      this.columnsDeposits = [
        {
          name: 'createdOnDate',
          title: 'routes.admin.wallet.creation_date',
          tableItem: {
            width: '150px',
            onClick: (data) => this.handleShowDeposits(data),
            render: (data) =>
              `<span class="text-blue-800 hover:text-blue-600 font-medium">${this.formatDate.transform(
                data.createdOnDate,
                'HH:mm:ss DD/MM/YYYY',
              )}</span>`,
          },
        },
        {
          name: 'transferContent',
          title: 'routes.admin.wallet.content',
          tableItem: {
            render: (data) => `<span class="font-normal">${data.transferContent}</span>`,
          },
        },
        {
          name: 'amount',
          title: 'routes.admin.wallet.transfer_amount',
          tableItem: {
            align: 'center',
            render: (data) => `<span class="font-normal">${this.formatCurrency.transform(data.amount, '₫')}</span>`,
          },
        },
      ];
    });
  }
}
