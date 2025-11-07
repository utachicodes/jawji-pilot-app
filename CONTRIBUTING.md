# Contributing to JAWJI Drone Delivery

Thank you for your interest in contributing to the JAWJI Drone Delivery platform!

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/utachicodes/jawji-drone-delivery.git`
3. Create a branch: `git checkout -b feature/your-feature-name`
4. Make your changes
5. Test thoroughly
6. Commit: `git commit -m "Add your feature"`
7. Push: `git push origin feature/your-feature-name`
8. Open a Pull Request

## Development Guidelines

### Code Style

- Use TypeScript for all new code
- Follow the existing code structure
- Use functional components with hooks
- Keep components small and focused
- Add proper TypeScript types

### Design System

- Follow the JAWJI design system (see main README)
- Use the existing color palette (#EF4444 primary)
- Use monospace fonts for technical elements
- Maintain consistent spacing (4px-based system)

### Component Guidelines

```typescript
// Good: Typed props, clear naming
interface ButtonProps {
  onPress: () => void;
  children: React.ReactNode;
  variant?: 'primary' | 'outline';
}

export const Button: React.FC<ButtonProps> = ({ onPress, children, variant = 'primary' }) => {
  // Component logic
};
```

### File Organization

```
src/
├── components/     # Reusable UI components
├── stores/         # State management
├── types/          # TypeScript types
└── utils/          # Helper functions

app/
├── (auth)/         # Auth screens
├── (client)/       # Client interface
├── (operator)/     # Operator interface
└── (admin)/        # Admin interface
```

## What to Contribute

### High Priority
- Real backend integration
- Map integration (Google Maps/Mapbox)
- Push notifications
- Real-time tracking
- Payment integration

### Medium Priority
- Image upload for packages
- Chat between client and operator
- Rating and review system
- Dark mode support
- Internationalization (i18n)

### Low Priority
- Additional animations
- More detailed analytics
- Advanced filtering options
- Export functionality

## Testing

Before submitting:

1. Test on both iOS and Android (if possible)
2. Test all three user roles
3. Check for TypeScript errors: `npx tsc --noEmit`
4. Ensure no console errors
5. Test on different screen sizes

## Pull Request Process

1. Update README.md if needed
2. Update FEATURES.md for new features
3. Add comments for complex logic
4. Ensure your code follows the style guide
5. Write a clear PR description

### PR Description Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
How to test these changes

## Screenshots
If applicable, add screenshots
```

## Code Review

All submissions require review. We'll:
- Check code quality
- Test functionality
- Verify design consistency
- Ensure TypeScript types are correct

## Questions?

- Open an issue for bugs
- Start a discussion for feature ideas
- Check existing issues before creating new ones

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

Thank you for contributing! 🚁
