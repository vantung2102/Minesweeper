import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    this.setup();
  }

  setup() {
    const element = $(this.element);
    const rowCount = element.data('width');
    const colCount = element.data('height');
    const gameState = element.data('board');

    for (let rowIndex = 0; rowIndex < rowCount; rowIndex++) {
      const row = $('<div>').addClass('row');

      for (let colIndex = 0; colIndex < colCount; colIndex++) {
        const cell = this.createCell(rowIndex, colIndex, gameState);
        row.append(cell);
      }

      element.append(row);
    }
  }

  createCell(row, col, gameState) {
    const cell = $('<div>')
      .addClass('cell')
      .attr('data-row', row)
      .attr('data-col', col)
      .on('click', () => this.handleCellClick(cell, row, col, gameState));

    return cell;
  }

  handleCellClick(cell, row, col, gameState) {
    if (gameState[row][col] === 'mine') {
      cell.addClass('exploded');
    } else {
      this.handleNonMineCellClick(cell, row, col, gameState);
    }
  }

  handleNonMineCellClick(cell, row, col, gameState) {
    const nearMines = gameState[row][col];
    let color;

    switch (nearMines) {
      case '0':
        color = 'transparent';
        break;
      case '1':
        color = 'blue';
        break;
      case '2':
        color = 'green';
        break;
      case '3':
        color = 'red';
        break;
      default:
        color = 'darkred';
    }

    cell.addClass(color, 'clear').text(nearMines);
  }
}
