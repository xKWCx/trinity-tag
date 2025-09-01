# Trinity Tag - Fire Extinguisher Inspection Management System

> Streamlining fire extinguisher inspections for Texas safety professionals

Trinity Tag is a modern web application designed specifically for fire extinguisher inspectors operating in Texas. The platform streamlines the entire inspection process, from maintaining up-to-date checklists to generating comprehensive reports that comply with Texas fire safety regulations.

## 🔥 Features

### Inspection Management

- **Digital Inspection Checklists**: Always up-to-date checklists that comply with Texas Fire Code requirements
- **Mobile-First Design**: Conduct inspections on any device, anywhere
- **Real-Time Data Sync**: Instant synchronization across all devices and team members
- **Photo Documentation**: Attach photos and evidence directly to inspection reports

### Report Generation & Distribution

- **Automated Report Generation**: Professional PDF reports generated instantly
- **Custom Templates**: Customizable report templates for different inspection types
- **Email Integration**: Automatically send reports to clients and stakeholders
- **Digital Signatures**: Secure digital signature capabilities for inspectors

### Organization Management

- **Multi-Organization Support**: Manage multiple inspection companies or departments
- **Team Collaboration**: Assign inspections to team members and track progress
- **Client Management**: Comprehensive database of clients and their properties
- **Inspection History**: Complete audit trail of all inspections and actions

### Compliance & Standards

- **Texas Fire Code Compliance**: Built-in compliance with Texas fire safety regulations
- **NFPA Standards**: Incorporates NFPA 10 standards for portable fire extinguishers
- **Regulatory Updates**: Automatic updates when regulations change
- **Certification Tracking**: Track inspector certifications and renewal dates

## 🚀 Technology Stack

Trinity Tag is built with modern, reliable technologies:

- **Backend**: Ruby on Rails 8.0+ with PostgreSQL
- **Frontend**: Tailwind CSS with Stimulus/Turbo for responsive interactions
- **Background Jobs**: Solid Queue for reliable job processing
- **Caching**: Solid Cache for optimal performance
- **Real-time Updates**: Solid Cable for live updates
- **Testing**: RSpec with comprehensive test coverage
- **Deployment**: Kamal for container-based deployment
- **PWA Support**: Works offline and can be installed on mobile devices

## 📱 Progressive Web App (PWA)

Trinity Tag functions as a Progressive Web App, offering:

- **Offline Capability**: Continue inspections even without internet connection
- **Mobile Installation**: Install directly on phones and tablets
- **Native App Experience**: Fast, responsive interface that feels like a native app
- **Background Sync**: Data syncs automatically when connection is restored

## 🛠 Installation & Setup

### Prerequisites

- Ruby 3.2+
- PostgreSQL 13+
- Node.js 18+ (for asset compilation)
- Redis (for background jobs)

### Development Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/your-org/trinity-tag.git
   cd trinity-tag
   ```

2. **Install dependencies**

   ```bash
   bundle install
   ```

3. **Setup database**

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Install JavaScript dependencies**

   ```bash
   npm install
   ```

5. **Start the development server**
   ```bash
   bin/dev
   ```

The application will be available at `http://localhost:3000`.

### Production Deployment

Trinity Tag uses Kamal for deployment. See `config/deploy.yml` for configuration options.

```bash
# Deploy to production
kamal deploy
```

## 🧪 Testing

Run the complete test suite:

```bash
# Run all tests
bundle exec rspec

# Run specific test files
bundle exec rspec spec/models/
bundle exec rspec spec/controllers/

# Generate coverage report
bundle exec rspec --format html --out coverage/index.html
```

## 🔧 Configuration

### Environment Variables

Create a `.env` file in the root directory:

```env
# Database
DATABASE_URL=postgresql://username:password@localhost/trinity_tag_production

# Email Configuration
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=your-email@example.com
SMTP_PASSWORD=your-app-password

# File Storage (AWS S3 recommended for production)
AWS_ACCESS_KEY_ID=your-access-key
AWS_SECRET_ACCESS_KEY=your-secret-key
AWS_REGION=us-east-1
AWS_BUCKET=trinity-tag-uploads

# Application Settings
HOST=your-domain.com
FORCE_SSL=true
```

### Key Configuration Files

- `config/application.rb` - Main application configuration
- `config/database.yml` - Database connection settings
- `config/routes.rb` - URL routing configuration
- `config/deploy.yml` - Kamal deployment settings

## 📊 Usage

### For Inspectors

1. **Sign in** to your organization account
2. **Create or select** an inspection checklist
3. **Navigate** to the inspection location
4. **Complete** the digital checklist on your mobile device
5. **Take photos** of equipment and any issues found
6. **Generate** the inspection report automatically
7. **Send** the report to the client via email

### For Organizations

1. **Manage** your team of inspectors
2. **Assign** inspections to specific team members
3. **Track** inspection progress in real-time
4. **Review** completed reports before client delivery
5. **Maintain** client relationships and inspection history
6. **Generate** compliance reports for regulatory agencies

## 🔐 Security

Trinity Tag implements industry-standard security practices:

- **Encrypted Data**: All sensitive data encrypted at rest and in transit
- **Secure Authentication**: Multi-factor authentication support
- **Role-Based Access**: Granular permissions for different user types
- **Audit Logging**: Complete audit trail of all actions
- **HTTPS Only**: All traffic encrypted with SSL/TLS
- **Regular Updates**: Automatic security patches and updates

## 🤝 Contributing

We welcome contributions from the fire safety community! Please read our [Contributing Guidelines](CONTRIBUTING.md) and [Code of Conduct](CODE_OF_CONDUCT.md).

### Development Workflow

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Write tests for your changes
4. Implement your feature
5. Run the test suite (`bundle exec rspec`)
6. Commit your changes (`git commit -am 'Add amazing feature'`)
7. Push to the branch (`git push origin feature/amazing-feature`)
8. Open a Pull Request

## 📈 Roadmap

### Upcoming Features

- [ ] **Mobile Apps**: Native iOS and Android applications
- [ ] **API Integration**: REST API for third-party integrations
- [ ] **Advanced Analytics**: Inspection trends and performance metrics
- [ ] **Equipment Tracking**: QR code and RFID integration
- [ ] **Inventory Management**: Track extinguisher inventory and maintenance
- [ ] **Automated Scheduling**: Smart scheduling based on inspection intervals
- [ ] **Multi-language Support**: Spanish language support for Texas market

## 📝 License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## 📞 Support & Contact

### Technical Support

- **Email**: support@trinity-tag.com
- **Documentation**: https://docs.trinity-tag.com
- **Status Page**: https://status.trinity-tag.com

### Business Inquiries

- **Sales**: sales@trinity-tag.com
- **Partnerships**: partners@trinity-tag.com
- **Phone**: (512) 555-0199

### Community

- **GitHub Issues**: Report bugs and request features
- **Discord**: Join our community chat
- **Newsletter**: Stay updated on new features and regulations

---

## 🏆 Recognition

Trinity Tag is proud to support Texas fire safety professionals in keeping communities safe. Built with ❤️ in Texas.

### Compliance Certifications

- ✅ Texas Fire Code Compliant
- ✅ NFPA 10 Standards Integrated
- ✅ SOC 2 Type II Certified
- ✅ GDPR Compliant
- ✅ CCPA Compliant

---

_"Making fire safety inspections safer, faster, and more reliable for Texas communities."_
