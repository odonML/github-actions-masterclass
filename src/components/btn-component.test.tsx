
import { render, fireEvent, cleanup} from '@testing-library/react';
import BtnComponent from './btn-component';
import { describe, it, expect, vi, afterEach } from 'vitest';
import '@testing-library/jest-dom/vitest';

describe('BtnComponent', () => {
    afterEach(() => {
        cleanup();
        vi.restoreAllMocks();
    1});

    it('renders the button with the correct text', () => {
        const { getByText } = render(<BtnComponent hi="Hello, world!" />);
        const buttonElement = getByText(/Click me Hello, world!/i);
        expect(buttonElement).toBeInTheDocument();
    });

    it('calls the soyHi function when the button is clicked', () => {
        const consoleSpy = vi.spyOn(console, 'log');
        const { getByText } = render(<BtnComponent hi="Hello, world!" />);
        const buttonElement = getByText(/Click me Hello, world!/i);
        fireEvent.click(buttonElement);
        expect(consoleSpy).toHaveBeenCalledWith('Button clicked!');
        consoleSpy.mockRestore();
    });
})